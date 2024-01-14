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
 |  File: Matrix+Method+Receive+ElementFromIndex.swift
 |  Created by: Egor Boyko
 |  Date: January 13th, 2024
 |  Last update: January 13th, 2024
 |  Version: 0.0.1
 |---------------------------------------------------------------------------------------
 |  Status: #Completed | #Decorated
 |---------------------------------------------------------------------------------------
 
 */

extension Matrix {
    ///Receiving element by index.
    ///
    ///Receiving an element processing error
    ///
    ///     //Row 1:   | 1 | 2 | 3 |
    ///     //Row 2:   | 4 | 5 | 6 |
    ///     //Row 3:   | 7 | 8 | 9 |
    ///
    ///     let element = try? matrix.receive(index: 4)
    ///     print(element)
    ///     // print Optional(5)
    ///
    ///A matrix index is similar to an array index. The elements in the matrix are counted from top to left to right.
    ///
    ///     //Row 1:   | 1 | 2 | 3 |
    ///     //Row 2:   | 4 | 5 | 6 |
    ///     //Row 3:   | 7 | 8 | 9 |
    ///
    ///     // similarly [1, 2, 3, 4, 5, 6, 7, 8, 9]
    ///
    ///Receiving an element with processing error
    ///
    ///     do {
    ///         let _ = try matrix.receive(index: 99)
    ///     } catch {
    ///         print(error)
    ///         // Matrix error. Index of range: 99
    ///     }
    ///
    /// - Parameter index: Element index
    /// - Note: Returns an error if the index are incorrect.
    /// - Returns: Optional element    
    public func receive(index: Int) throws -> Optional<Element> {
        if (index > self.storage.count - 1) || index < 0 {
            throw MatrixError.indexOfRange(index)
        }
        return self.storage[index]
    }
}

