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
        init(matrix: Matrix<T>, _ direction: Matrix.IterationDirection) {
            self.elements = matrix.storage
            self.column = matrix.column
            self.row = matrix.row
            self.direction = direction
            self.x = (direction == .downToUp || direction == .rightToLeft) ? matrix.column : 1
            self.y = (direction == .downToUp || direction == .rightToLeft) ? matrix.row : 1
        }
        
        let direction: Matrix.IterationDirection
        let elements: [T?]
        let column: Int
        let row: Int
        var x: Int
        var y: Int
    
        public mutating func next() -> Element? {
            if self.x == 0  {
                return nil
            }
            
            let index = x - 1 + (self.column * (y - 1))
            let x = self.x
            let y = self.y
            
            switch self.direction {
            case .upToDown:
                if self.x >= self.column && self.y != self.row {
                    self.x = 1
                    self.y += 1
                } else if self.x >= self.column && self.y == self.row {
                    self.x = 0
                } else {
                    self.x += 1
                }
            case .downToUp:
                if self.x <= 1 && self.y != 1 {
                    self.x = 5
                    self.y -= 1
                } else if self.x <= 1 && self.y == 1 {
                    self.x = 0
                } else {
                    self.x -= 1
                }
            case .leftToRight:
                if self.y >= self.row && self.x != self.column {
                    self.y = 1
                    self.x += 1
                } else if self.y >= self.row && self.x == self.column {
                    self.x = 0
                } else {
                    self.y += 1
                }
            case .rightToLeft:
                if self.y <= 1 && self.x != 1 {
                    self.y = 5
                    self.x -= 1
                } else if self.y <= 1 && self.x == 1 {
                    self.x = 0
                } else {
                    self.y -= 1
                }
            }
            return (x, y, index)
        }
    }
}
