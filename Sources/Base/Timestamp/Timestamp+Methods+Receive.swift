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
 |  File: Timestamp+Methods+Receive.swift
 |  Created by: Egor Boyko
 |  Date: December 29th, 2023
 |  Last update: December 30th, 2023
 |  Version: 0.0.1
 |---------------------------------------------------------------------------------------
 |  Status: #In progress | #Not decorated
 |---------------------------------------------------------------------------------------
 
 */

extension Timestamp {
    public func receive(
        output: Self.OutputOption,
        _ option: Self.Option = .timeIntervalSince1970) -> Int {
            switch output {
            case .seconds:
                return .init(self.rawValue + option.timeIntervalOption.timeInterval)
            case .microseconds:
                let fraction = self.rawValue - .init(Int(self.rawValue))
                return .init(fraction * 1_000_000)
            case .preciseMicroseconds:
                let spited = "\(self.rawValue)".split(separator: ".")
                guard spited.count > 1 else {
                    return 0
                }
                let result = Int(spited[1]) ?? 0
                print("Резултат = \(result)")
                if result < 100_000 {
                    return result * 10
                } else if result >= 1_000_000 {
                    return result / 10
                } else {
                    return result
                }
            }
        }
    
    public func receive(
        option: Self.Option) -> TimeInterval {
            self.rawValue + option.timeIntervalOption.timeInterval
        }
}
