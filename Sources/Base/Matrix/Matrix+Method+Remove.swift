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
 |  File: Matrix+Method+Remove.swift
 |  Created by: Egor Boyko
 |  Date: January 14th, 2024
 |  Last update: January 14th, 2024
 |  Version: 0.0.1
 |---------------------------------------------------------------------------------------
 |  Status: #Completed | #Decorated
 |---------------------------------------------------------------------------------------
 
 */

extension Matrix {
    ///Removing a value at the specified coordinates
    ///
    ///     //Row 1:          | 0 | 0 | 0 |
    ///     //Row 2:          | 0 | 0 | 0 |
    ///     //Row 3:          | 0 | 0 | 0 |
    ///
    ///     let removing = try? matrix.remove(x: 2, y: 2)
    ///
    ///     //Row 1:          | 0 |  0  | 0 |
    ///     //Row 2:          | 0 | nil | 0 |
    ///     //Row 3:          | 0 |  0  | 0 |
    ///
    ///     print(removing)
    ///     // Print Optional(0)
    ///
    /// - Parameter x: Coordinate corresponding to the position in the row
    /// - Parameter y: Coordinate corresponding to the position in the column
    /// - Note: By calling a method in different threads on the same instance,
    /// you will not receive an exception, but the behavior will be undefined
    @discardableResult
    public mutating func remove(x xCoordinate: Int, y yCoordinate: Int) throws -> Element? {
        var temp = self
        let index = try temp.index(x: xCoordinate, y: yCoordinate)
        let removing = temp.storage[index]
        temp.storage[index] = nil
        self = temp
        return removing
    }
}

