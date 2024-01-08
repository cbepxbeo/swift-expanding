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
 |  File: Matrix+Subtype+MatrixIterator.swift
 |  Created by: Egor Boyko
 |  Date: January 8th, 2024
 |  Last update: January 8th, 2024
 |  Version: 0.0.1
 |---------------------------------------------------------------------------------------
 |  Status: #In progress | #Not decorated
 |---------------------------------------------------------------------------------------
 
 */

extension Matrix   {
    public struct MatrixIterator<T>: IteratorProtocol {
        public typealias Element = (x: Int, y: Int, element: T?)
        
        let matrix: Matrix<T>
        var position: Int
        
        init(matrix: Matrix<T>) {
            self.matrix = matrix
            self.position = matrix.storage.startIndex
        }

        public mutating func next() -> Element? {
            guard self.position != self.matrix.storage.endIndex,
                  let coordinates = try? self.matrix.coordinates(from: self.position) else {
                return nil
            }
            let element = self.matrix.storage[self.position]
            self.matrix.storage.formIndex(after: &self.position)
            return (coordinates.x, coordinates.y, element)
        }
    }
    
}