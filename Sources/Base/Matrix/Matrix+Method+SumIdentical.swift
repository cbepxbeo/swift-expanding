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
 |  File: Matrix+Method+SumIdentical.swift
 |  Created by: Egor Boyko
 |  Date: January 11th, 2024
 |  Last update: January 13th, 2024
 |  Version: 0.0.1
 |---------------------------------------------------------------------------------------
 |  Status: #Completed | #Decorated
 |---------------------------------------------------------------------------------------
 
 */

extension Matrix where Element: SignedNumeric {
    ///Sums identical elements that are in adjacent cells in the specified direction
    ///
    ///Example with upward direction
    ///
    ///     //Row 1:          | 2 | 2 | 2 | 2 | 2 |
    ///     //Row 2:          | 2 | 2 | 2 | 2 | 2 |
    ///     //Row 3:          | 2 | 2 | 2 | 2 | 2 |
    ///     //Row 4:          | 2 | 2 | 2 | 2 | 2 |
    ///     //Row 5:          | 2 | 2 | 2 | 2 | 2 |
    ///
    ///     matrix.sumIdentical(in: .upward)
    ///
    ///     //Row 1:          |  4  |  4  |  4  |  4  |  4  |
    ///     //Row 2:          | nil | nil | nil | nil | nil |
    ///     //Row 3:          |  4  |  4  |  4  |  4  |  4  |
    ///     //Row 4:          | nil | nil | nil | nil | nil |
    ///     //Row 5:          |  2  |  2  |  2  |  2  |  2  |
    ///
    ///Example with left direction
    ///
    ///     //Row 1:          | 2 | 2 | 2 | 2 | 2 |
    ///     //Row 2:          | 2 | 2 | 2 | 2 | 2 |
    ///     //Row 3:          | 2 | 2 | 2 | 2 | 2 |
    ///     //Row 4:          | 2 | 2 | 2 | 2 | 2 |
    ///     //Row 5:          | 2 | 2 | 2 | 2 | 2 |
    ///
    ///     matrix.sumIdentical(in: .left)
    ///
    ///     //Row 1:          | 4 | nil | 4 | nil | 2 |
    ///     //Row 2:          | 4 | nil | 4 | nil | 2 |
    ///     //Row 3:          | 4 | nil | 4 | nil | 2 |
    ///     //Row 4:          | 4 | nil | 4 | nil | 2 |
    ///     //Row 5:          | 4 | nil | 4 | nil | 2 |
    ///
    /// - Parameter direction: The direction in which adjacent elements will be summed
    /// - Returns: Coordinates of the elements that were summedned
    @discardableResult
    public mutating func sumIdentical(in direction: Matrix.Direction) -> [(from: Int, to: Int)] {
        //General process logic
        func sharedProcess(
            condition: ((x: Int, y: Int)) -> Bool,
            nextIndex: (_ index: Int) -> Int){
                self.iterate { x, y, index in
                    if self.storage[index] != nil && condition((x, y)) {
                        let nextIndex = nextIndex(index)
                        if combineAndClear(from: nextIndex, to: index) {
                            output.append((nextIndex, index))
                        }
                    }
                }
        }
        //If the elements are the same, then the destination will
        //be assigned double the result and the original value cleared
        func combineAndClear(from: Int, to: Int) -> Bool {
            if let elementFrom = self.storage[from],
               let elementTo = self.storage[to],
               elementFrom == elementTo {
                self.storage[to] = elementFrom + elementTo
                self.storage[from] = nil
                return true
            }
            return false
        }
        //Return value
        var output: [(from: Int, to: Int)] = []
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
        return output
    }
    
    
    
    
    
    
}
