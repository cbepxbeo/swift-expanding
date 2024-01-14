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
 |  File: Matrix+Method+Receive+ElementFromCoordinates.swift
 |  Created by: Egor Boyko
 |  Date: January 5th, 2024
 |  Last update: January 13th, 2024
 |  Version: 0.0.1
 |---------------------------------------------------------------------------------------
 |  Status: #Completed | #Decorated
 |---------------------------------------------------------------------------------------
 
 */

extension Matrix {
    ///Receiving element by coordinates.
    ///
    ///Receiving an element without processing errors
    ///
    ///     //Row 1:   | 1 | 2 | 3 |
    ///     //Row 2:   | 4 | 5 | 6 |
    ///     //Row 3:   | 7 | 8 | 9 |
    ///
    ///     let element = try? matrix.receive(x: 2, y: 2)
    ///     print(element)
    ///     // print Optional(5)
    ///
    ///     do {
    ///         let _ = try matrix.receive(x: 99, y: 2)
    ///     } catch {
    ///         print(error)
    ///         // Matrix error: Column of range: 99
    ///     }
    ///
    ///     do {
    ///         let _ = try matrix.receive(x: 0, y: 2)
    ///     } catch {
    ///         print(error)
    ///         // Matrix error. Zero coordinate x
    ///     }
    ///
    ///     do {
    ///         let _ = try matrix.receive(x: -1, y: 2)
    ///     } catch {
    ///         print(error)
    ///         // Matrix error. Negative coordinate x: -1
    ///     }
    ///
    /// - Parameter x: x coordinate
    /// - Parameter y: y coordinate Unlike an index, the count starts from one
    /// - Note: Returns an error if the coordinates are incorrect.
    /// Unlike an index, coordinates start from one.
    /// - Returns: Optional element
    public func receive(x xCoordinate: Int, y yCoordinate: Int) throws -> Optional<Element> {
        try self.storage[self.index(x: xCoordinate, y: yCoordinate)]
    }
}

