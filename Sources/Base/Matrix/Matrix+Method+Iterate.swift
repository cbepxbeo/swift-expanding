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
 |  File: Matrix+Method+Iterate.swift
 |  Created by: Egor Boyko
 |  Date: January 9th, 2024
 |  Last update: January 10th, 2024
 |  Version: 0.0.1
 |---------------------------------------------------------------------------------------
 |  Status: #In progress | #Not decorated
 |---------------------------------------------------------------------------------------
 
 */

extension Matrix {
    public func iterate(
        body: (
            _ xCoordinate: Int,
            _ yCoordinate: Int,
            _ index: Int) -> ()){
                for item in MatrixIndexSequence(matrix: self) {
                    body(item.x, item.y, item.index)
                }
            }
    
    @inlinable
    @inline(__always)
    public func iterate(
        direction: IterationDirection,
        handler: (
            _ xCoordinate: Int,
            _ yCoordinate: Int,
            _ index: Int) -> ()) {
                let iteratorA: NumberSequence
                let iteratorB: NumberSequence
                switch direction {
                case .upToDown:
                    iteratorA = NumberSequence(1, self.row)
                    iteratorB = NumberSequence(1, self.column)
                case .downToUp:
                    iteratorA = NumberSequence(self.row, 1)
                    iteratorB = NumberSequence(1, self.column)
                case .leftToRight:
                    iteratorA = NumberSequence(1, self.column)
                    iteratorB = NumberSequence(1, self.row)
                case .rightToLeft:
                    iteratorA = NumberSequence(self.column, 1)
                    iteratorB = NumberSequence(1, self.row)
                }
                
                for a in iteratorA {
                    for b in iteratorB {
                        let currentColumn: Int
                        let currentRow: Int
                        switch direction {
                        case .upToDown, .downToUp:
                            currentColumn = b
                            currentRow = a
                        case .leftToRight, .rightToLeft:
                            currentColumn = a
                            currentRow = b
                        }
                        let index = currentColumn - 1 + (self.column * (currentRow - 1))
                        handler(currentColumn, currentRow, index)
                    }
                }
            }
}

