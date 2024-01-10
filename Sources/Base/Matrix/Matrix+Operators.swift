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
    public static func +(lhs: Self, rhs: Self) -> Self {
        var row = Swift.max(lhs.row, rhs.row)
        var column =  Swift.max(lhs.column, rhs.column)
        
        if row < 1 { row = 1 }
        
        if column < 1 { column = 1 }
        var newMatrix = try! Matrix(column: column, row: row, element: Element.self)
        
        lhs.forEach{ x, y, element in
            try? newMatrix.addTo(element ?? 0, x: x, y: y)
        }
        
        rhs.forEach { x, y, element in
            try? newMatrix.addTo(element ?? 0, x: x, y: y)
        }
        return newMatrix
    }
}

