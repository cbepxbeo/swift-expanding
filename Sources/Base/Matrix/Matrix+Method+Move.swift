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
 |  File: Matrix+Method+Move.swift
 |  Created by: Egor Boyko
 |  Date: January 9th, 2024
 |  Last update: January 10th, 2024
 |  Version: 0.0.1
 |---------------------------------------------------------------------------------------
 |  Status: #In progress | #Not decorated
 |---------------------------------------------------------------------------------------
 
 */

extension Matrix {
    public mutating func move(_ direction: Matrix.Direction) {
        switch direction {
        case .upward:
            recruscentPassage { out in
                self.iterate { xCoordinate, yCoordinate, index in
                    if self.storage[index] == nil && yCoordinate < self.row {
                        let nextIndex = index + self.column
                        out = !self.rearrangement(from: nextIndex, to: index)
                    }
                }
            }
        case .downward:
            recruscentPassage { out in
                self.iterate{ xCoordinate, yCoordinate, index in
                    if self.storage[index] == nil && yCoordinate > 1 {
                        let nextIndex = index - self.column
                        out = !self.rearrangement(from: nextIndex, to: index)
                    }
                }
            }
        case .left:
            recruscentPassage { out in
                self.iterate{ xCoordinate, yCoordinate, index in
                    if self.storage[index] == nil && xCoordinate < self.column {
                        let nextIndex = index + 1
                        out = !self.rearrangement(from: nextIndex, to: index)
                    }
                }
            }
        case .right:
            recruscentPassage { out in
                self.iterate { xCoordinate, yCoordinate, index in
                    if self.storage[index] == nil && xCoordinate > 1 {
                        let nextIndex = index - 1
                        out = !self.rearrangement(from: nextIndex, to: index)
                    }
                }
            }
        }
    }
}

