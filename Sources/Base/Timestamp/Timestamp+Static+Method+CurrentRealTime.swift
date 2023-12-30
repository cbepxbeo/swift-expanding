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
 |  File: Timestamp+Static+Method+CurrentRealTime.swift
 |  Created by: Egor Boyko
 |  Date: December 30th, 2023
 |  Last update: December 30th, 2023
 |  Version: 0.0.1
 |---------------------------------------------------------------------------------------
 |  Status: #Completed | #Not required
 |---------------------------------------------------------------------------------------
 
 */

#if canImport(Darwin)
import Darwin
#elseif canImport(Glibc)
import Glibc
#elseif canImport(WinSDK)
import WinSDK
#endif

extension Timestamp {
    static func currentRealTime() -> TimeInterval {
#if canImport(WinSDK)
        //intervals since January 1, 1601 (UTC)
        var fileTime: FILETIME = FILETIME()
        var ulargeInteger: ULARGE_INTEGER = ULARGE_INTEGER()
        GetSystemTimePreciseAsFileTime(&fileTime)
        ulargeInteger.LowPart = fileTime.dwLowDateTime
        ulargeInteger.HighPart = fileTime.dwHighDateTime
        return TimeInterval((ulargeInteger.QuadPart - 1164447360_000_000) / 1_000_000_000)
#else
        var timespec: timespec = timespec()
        clock_gettime(CLOCK_REALTIME, &timespec)
        var result = TimeInterval(timespec.tv_sec)
        - Self.TimeIntervalOption.timeIntervalbetween1970AndReferenceDate
        result += (1.0E-9 * TimeInterval(timespec.tv_nsec))
        return result
#endif
    }
}
