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
 |  File: Matrix+Method+Rearrangement.swift
 |  Created by: Egor Boyko
 |  Date: January 9th, 2024
 |  Last update: January 13th, 2024
 |  Version: 0.0.1
 |---------------------------------------------------------------------------------------
 |  Status: #Completed | #Decorated
 |---------------------------------------------------------------------------------------
 
 */

extension Matrix {
    ///Moves all elements in a specific direction
    ///
    ///Example with rearranging elements up
    ///
    ///     //Row 1:          | nil |  1  | nil | nil |
    ///     //Row 2:          | nil |  1  |  2  | nil |
    ///     //Row 3:          | nil | nil | nil | nil |
    ///     //Row 4:          | nil |  2  |  2  | nil |
    ///     //Row 4:          | nil |  1  | nil | nil |
    ///
    ///     matrix.rearrangement(in: .upward)
    ///
    ///     //Row 1:          | nil |  1  |  2  | nil |
    ///     //Row 2:          | nil |  1  |  2  | nil |
    ///     //Row 3:          | nil |  2  | nil | nil |
    ///     //Row 4:          | nil |  1  | nil | nil |
    ///     //Row 4:          | nil | nil | nil | nil |
    ///
    ///Example with rearranging elements left
    ///
    ///     //Row 1:          | nil | nil |  1  | nil |
    ///     //Row 2:          | nil |  1  | nil |  2  |
    ///     //Row 3:          | nil | nil | nil | nil |
    ///     //Row 4:          | nil |  2  |  2  | nil |
    ///     //Row 4:          |  1  | nil | nil |  1  |
    ///
    ///     matrix.rearrangement(in: .left)
    ///
    ///     //Row 1:          |  1  | nil | nil | nil |
    ///     //Row 2:          |  1  |  2  | nil | nil |
    ///     //Row 3:          | nil | nil | nil | nil |
    ///     //Row 4:          |  2  |  2  | nil | nil |
    ///     //Row 4:          |  1  |  1  | nil | nil |
    ///
    /// - Parameter direction: The direction in which the elements will move
    public mutating func rearrangement(in direction: Matrix.Direction) {
        //General process logic
        func sharedProcess(
            condition: ((x: Int, y: Int)) -> Bool,
            nextIndex: (_ index: Int) -> Int){
                self.iterateRecursively{ x, y, index, out in
                    if self.storage[index] == nil && condition((x, y)) {
                        let nextIndex = nextIndex(index)
                        rearrangeAndClean(from: nextIndex, to: index, out: &out)
                    }
                }
        }
        //If an element exists in the source cell, it will be copied to the
        //destination cell, and then the source cell will be reset to nil
        func rearrangeAndClean(from: Int, to: Int, out: inout Bool){
            if self.storage[from] != nil {
                self.storage[to] = self.storage[from]
                self.storage[from] = nil
                out = false
            }
        }
        switch direction {
        case .upward:
            sharedProcess(condition: { $0.y < self.row }, nextIndex: { $0 + self.column })
        case .downward:
            sharedProcess(condition: { $0.y > 1 }, nextIndex: { $0 - self.column })
        case .left:
            sharedProcess(condition: { $0.x < self.column }, nextIndex: { $0 + 1 })
        case .right:
            sharedProcess(condition: { $0.x > 1 }, nextIndex: { $0 - 1 })
        }
    }
}

