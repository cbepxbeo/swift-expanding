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
 |  File: Matrix+Method+Set.swift
 |  Created by: Egor Boyko
 |  Date: January 6th, 2024
 |  Last update: January 7th, 2024
 |  Version: 0.0.1
 |---------------------------------------------------------------------------------------
 |  Status: #Completed | #Decorated
 |---------------------------------------------------------------------------------------
 
 */

extension Matrix {
    /// Sets a new value at the specified coordinates
    ///
    ///     var matrix = try! Matrix(column: 3, row: 3, defaultValue: 0)
    ///
    ///     //Row 1:          | 0 | 0 | 0 |
    ///     //Row 2:          | 0 | 0 | 0 |
    ///     //Row 3:          | 0 | 0 | 0 |
    ///
    ///     try? matrix.set(5, x: 2, y: 3)
    ///
    ///     //Row 1:          | 0 | 0 | 0 |
    ///     //Row 2:          | 0 | 0 | 0 |
    ///     //Row 3:          | 0 | 5 | 0 |
    ///
    /// - Parameter value: New value
    /// - Parameter x: Coordinate corresponding to the position in the line
    /// - Parameter y: Coordinate corresponding to the position in the column
    /// - Note: By calling a method in different threads on the same instance, you will not receive an exception, but the behavior will be undefined
    public mutating func set(_ value: Element, x xCoordinate: Int, y yCoordinate: Int) throws {
        var temp = self
        let index = try temp.index(x: xCoordinate, y: yCoordinate)
        temp.storage[index] = value
        self = temp
    }
}

