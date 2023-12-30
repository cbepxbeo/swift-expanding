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
        lhs.receive(option: .timeIntervalSince) > rhs.receive(option: .timeIntervalSince)
    }
    public static func < (lhs: Timestamp, rhs: Timestamp) -> Bool {
        lhs.receive(option: .timeIntervalSince) < rhs.receive(option: .timeIntervalSince)
    }
    public static func <= (lhs: Timestamp, rhs: Timestamp) -> Bool {
        lhs.receive(option: .timeIntervalSince) <= rhs.receive(option: .timeIntervalSince)
    }
    public static func >= (lhs: Timestamp, rhs: Timestamp) -> Bool {
        lhs.receive(option: .timeIntervalSince) >= rhs.receive(option: .timeIntervalSince)
    }
    public static func + (lhs: Timestamp, rhs: Timestamp) -> Timestamp {
        .init(rawValue: lhs.rawValue + rhs.rawValue)
    }
    public static func - (lhs: Timestamp, rhs: Timestamp) -> Timestamp {
        .init(rawValue: lhs.rawValue - rhs.rawValue)
    }
}
