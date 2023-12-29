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
 |  File: Timestamp+Operators.swift
 |  Created by: Egor Boyko
 |  Date: December 29th, 2023
 |  Last update: December 29th, 2023
 |  Version: 0.0.1
 |---------------------------------------------------------------------------------------
 |  Status: #In progress | #Not decorated
 |---------------------------------------------------------------------------------------
 
 */

extension Timestamp {
    public static func > (lhs: Timestamp, rhs: Timestamp) -> Bool {
        lhs.rawValue > rhs.rawValue
    }
    public static func < (lhs: Timestamp, rhs: Timestamp) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
    public static func <= (lhs: Timestamp, rhs: Timestamp) -> Bool {
        lhs.rawValue <= rhs.rawValue
    }
    public static func >= (lhs: Timestamp, rhs: Timestamp) -> Bool {
        lhs.rawValue >= rhs.rawValue
    }
    public static func + (lhs: Timestamp, rhs: Timestamp) -> Timestamp {
        let a = lhs.rawValue.0 + rhs.rawValue.0
        let b = lhs.rawValue.1 + rhs.rawValue.1
        if b > 1_000_000_000 {
            return .init(rawValue: (a + 1, b - 1_000_000_000))
        } else {
            return .init(rawValue: (a, b))
        }
    }
    public static func - (lhs: Timestamp, rhs: Timestamp) -> Timestamp {
        let a = lhs.rawValue.0 - rhs.rawValue.0
        let b = lhs.rawValue.1 - rhs.rawValue.1
        if b < 0 {
            return .init(rawValue: (a - 1, b + 1_000_000_000))
        } else {
            return .init(rawValue: (a, b))
        }
    }
}
