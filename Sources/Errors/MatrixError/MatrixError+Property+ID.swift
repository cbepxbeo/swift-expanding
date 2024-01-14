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
 |  File: MatrixError+Property+ID.swift
 |  Created by: Egor Boyko
 |  Date: January 7th, 2024
 |  Last update: January 7th, 2024
 |  Version: 0.0.1
 |---------------------------------------------------------------------------------------
 |  Status: #In progress | #Not decorated
 |---------------------------------------------------------------------------------------
 
 */

extension MatrixError {
    var ID: Int {
        switch self {
        case .indexOfRange:
            1
        case .columnOfRange(_):
            2
        case .rowOfRange(_):
            3
        case .columnNotFound:
            4
        case .rowNotFound:
            5
        case .negativeCoordinate(_):
            6
        case .zeroCoordinate(_):
            7
        case .wrongStructure(_):
            8
        case .matricesNotIdenticalStructure:
            9
        case .cannotBeDividedByZero(_):
            10
        }
    }
}


