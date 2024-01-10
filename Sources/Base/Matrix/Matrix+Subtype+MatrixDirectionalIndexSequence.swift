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
 |  File: Matrix+Subtype+MatrixDirectionalIndexSequence.swift
 |  Created by: Egor Boyko
 |  Date: January 10th, 2024
 |  Last update: January 10th, 2024
 |  Version: 0.0.1
 |---------------------------------------------------------------------------------------
 |  Status: #In progress | #Not decorated
 |---------------------------------------------------------------------------------------
 
 */


extension Matrix   {
    public struct MatrixDirectionalIndexSequence<T>: Sequence, IteratorProtocol {
        public typealias Element = (x: Int, y: Int, index: Int)
        
        let direction: Matrix.Direction
        let elements: [T?]
        let column: Int
        let row: Int
        var x: Int
        var y: Int
        
        init(matrix: Matrix<T>, direction: Matrix.Direction) {
            self.elements = matrix.storage
            self.column = matrix.column
            self.row = matrix.row
            self.direction = direction
            self.x = 1
            self.y = 1
        }
        
        public mutating func next() -> Element? {
            if self.column == self.x && self.row == self.y {
                return nil
            }
            
            let index = x - 1 + (self.column * (y - 1))
            let x = self.x
            let y = self.y
            
            if self.x >= self.column {
                self.x = 1
                self.y += 1
            } else {
                self.x += 1
            }
            
            return (x, y, index)
        }
    }
}
