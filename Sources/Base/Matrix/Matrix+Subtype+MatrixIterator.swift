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
        var index: Int?
        
        func nextIndex(for index: Int?) -> Int? {
            if let index = index, index < self.matrix.storage.count - 1 {
                return index + 1
            }
            if index == nil, !self.matrix.storage.isEmpty {
                return 0
            }
            return nil
        }
        
        public mutating func next() -> Element? {
            if let index = self.nextIndex(for: self.index),
               let coordinates = try? self.matrix.coordinates(from: index) {
                self.index = index
                return (coordinates.x, coordinates.y, self.matrix.storage[index])
            }
            return nil
        }
    }
    
}
