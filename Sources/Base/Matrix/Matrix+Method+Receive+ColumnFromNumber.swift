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
 |  File: Matrix+Method+Receive+ColumnFromNumber.swift
 |  Created by: Egor Boyko
 |  Date: January 13th, 2024
 |  Last update: January 13th, 2024
 |  Version: 0.0.1
 |---------------------------------------------------------------------------------------
 |  Status: #Completed | #Decorated
 |---------------------------------------------------------------------------------------
 
 */

extension Matrix {
    ///Receiving all elements located in a column
    ///
    ///Receiving without processing error
    ///
    ///     //Row 1:   | 1 | 2 | 3 |
    ///     //Row 2:   | 4 | 5 | 6 |
    ///     //Row 3:   | 7 | 8 | 9 |
    ///
    ///     let array = try? matrix.receive(column: 3)
    ///     print(array)
    ///     // print [Optional(3), Optional(6), Optional(9)]
    ///
    ///Receiving with processing error
    ///
    ///     do {
    ///         let _ = try matrix.receive(column: 99)
    ///     } catch {
    ///         print(error)
    ///         // Matrix error: Column of range: 99
    ///     }
    ///
    /// - Parameter row: Сolumn number
    /// - Note: Returns an error if the column number is incorrect.
    /// - Returns: An array of optional elements located in the column
    public func receive(column input: Int) throws -> [Optional<Element>] {
        guard let _ = try? self.check(x: input) else {
            throw MatrixError.columnOfRange(input)
        }
        var temp: [Optional<Element>] = []
        for row in 1...self.row {
            temp.append(
                self.storage[input - 1 + (self.column * (row - 1))]
            )
        }
        return temp
    }
}

