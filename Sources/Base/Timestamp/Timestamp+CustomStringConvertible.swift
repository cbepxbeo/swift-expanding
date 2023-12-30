/*
 
 |---------------------------------------------------------------------------------------
 |  Copyright The Swift-Expanding Contributors.
 |  Licensed under the Apache License, Version 2.0 (the "License");
 |  you may not use this file except in compliance with the License.
 |  You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
 |
 |  Unless required by applicable law or agreed to in writing, software
 |  distributed under the License is distributed on an "AS IS" BASIS,
 |  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 |  See the License for the specific language governing permissions and
 |  limitations under the License.
 |---------------------------------------------------------------------------------------
 |  File: Timestamp+CustomStringConvertible.swift
 |  Created by: Egor Boyko
 |  Date: December 29th, 2023
 |  Last update: December 30th, 2023
 |  Version: 0.0.1
 |---------------------------------------------------------------------------------------
 |  Status: #In progress | #Not decorated
 |---------------------------------------------------------------------------------------
 
 */

#if canImport(Darwin)
import Darwin
#elseif canImport(Glibc)
import Glibc
#elseif canImport(WinSDK)
import WinSDK
#endif

extension Timestamp: CustomStringConvertible {
    public var description: String {
#if canImport(Glibc)
        let format = "%4Y-%m-%d %H:%M:%S +0000"
#else
        let format = "%Y-%m-%d %H:%M:%S +0000"
#endif
        let unavailable = "<description unavailable>"
        guard self >= Self.distant(.past),  self <= Self.distant(.future) else {
            return unavailable
        }
        var info = tm()
#if os(Windows)
        var time = __time64_t(self.receive(option: .timeIntervalSince1970))
        let errno: errno_t = _gmtime64_s(&info, &time)
        guard errno == 0 else { return unavailable }
#else
        var time = time_t(self.receive(option: .timeIntervalSince1970))
        gmtime_r(&time, &info)
#endif
        let bufferSize = 128
        return withUnsafeTemporaryAllocation(of: CChar.self, capacity: bufferSize) { buffer in
            guard let ptr = buffer.baseAddress,
                  strftime(ptr, bufferSize, format, &info) != 0,
                  let result = String(validatingUTF8: ptr) else {
                return unavailable
            }
            return result
        }
    }
}
