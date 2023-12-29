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
 |  File: Timestamp+Initializers.swift
 |  Created by: Egor Boyko
 |  Date: December 29th, 2023
 |  Last update: December 29th, 2023
 |  Version: 0.0.1
 |---------------------------------------------------------------------------------------
 |  Status: #In progress | #Not decorated
 |---------------------------------------------------------------------------------------
 
 */

#if canImport(Darwin)
  import Darwin
#elseif canImport(Glibc)
  import Glibc
#else
  #error("Unsupported platform")
#endif

extension Timestamp {
    public init(){
        var time = timespec()
        clock_gettime(CLOCK_REALTIME, &time)
        self.init(timespec: time)
    }
    public init(timespec: timespec) {
        self.init(rawValue: (.init(timespec.tv_sec), .init(timespec.tv_nsec)))
    }
}

#if canImport(Foundation)
import Foundation

extension Timestamp  {
    public init(from date: Date) {
        let timeInterval = date.timeIntervalSince1970
        self.init(
            rawValue: (
                .init(timeInterval.magnitude),
                .init(
                    timeInterval
                        .magnitude
                        .truncatingRemainder(dividingBy: 1) * 1000_000_000
                )
            )
        )
    }
}
#endif
