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
 |  File: MatrixError+Protocol+CustomStringConvertible.swift
 |  Created by: Egor Boyko
 |  Date: January 14th, 2024
 |  Last update: January 14th, 2024
 |  Version: 0.0.1
 |---------------------------------------------------------------------------------------
 |  Status: #In progress | #Not decorated
 |---------------------------------------------------------------------------------------
 
 */

extension MatrixError: CustomStringConvertible {
    public var description: String {
        "Matrix error. " + self.errorDescription
    }
    var errorDescription: String {
        switch self {
        case .indexOfRange(let index):
            "Index of range: \(index)"
        case .columnOfRange(let column):
            "Column of range: \(column)"
        case .rowOfRange(let row):
            "Row of range: \(row)"
        case .columnNotFound(let column):
            "Column not found: \(column)"
        case .rowNotFound(let row):
            "Row not found: \(row)"
        case .negativeCoordinate(let message):
            "Negative coordinate \(message)"
        case .zeroCoordinate(let message):
            "Zero coordinate \(message)"
        case .wrongStructure(let message):
            "Wrong matrix structure \(message)"
        case .matricesNotIdenticalStructure:
            "Matrices not identical structure"
        case .cannotBeDividedByZero(let message):
            "Cannot be divided by zero \(message)"
        }
    }
}


