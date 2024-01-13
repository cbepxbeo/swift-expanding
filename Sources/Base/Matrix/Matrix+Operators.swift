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
 |  File: Matrix+Operators.swift
 |  Created by: Egor Boyko
 |  Date: January 6th, 2024
 |  Last update: January 7th, 2024
 |  Version: 0.0.1
 |---------------------------------------------------------------------------------------
 |  Status: #In progress | #Not decorated
 |---------------------------------------------------------------------------------------
 
 */

extension Matrix where Element: SignedNumeric {
    public static func +(lhs: Self, rhs: Self) throws -> Self {
        if lhs.column != rhs.column || lhs.row != rhs.row {
            throw MatrixError.matricesNotIdenticalStructure
        }
        var newMatrix = Matrix(column: lhs.column, row: lhs.row, storage: lhs.storage)
        rhs.forEach{ (x, y, element) in
            if let element {
                try? newMatrix.addTo(element, x: x, y: y)
            }
        }
        return newMatrix
    }
    
    public static func *(lhs: Self, rhs: Self) throws -> Self {
        if lhs.column != rhs.column || lhs.row != rhs.row {
            throw MatrixError.matricesNotIdenticalStructure
        }
        var newMatrix = try Matrix(column: lhs.column, row: lhs.row, element: Element.self)
        try lhs.forEach{ (x, y, element) in
            if element != nil || (try? rhs.receive(x: x, y: y)) != nil {
                let a = element ?? 1
                let b = (try? rhs.receive(x: x, y: y)) ?? 1
                try newMatrix.set(a * b, x: x, y: y)
            } else if let a = element, let b = try? rhs.receive(x: x, y: y) {
                try newMatrix.set(a * b, x: x, y: y)
            }
        }
        return newMatrix
    }
    
    
}

