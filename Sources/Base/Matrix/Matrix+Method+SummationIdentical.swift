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
 |  File: Matrix+Method+SummationIdentical.swift
 |  Created by: Egor Boyko
 |  Date: January 11th, 2024
 |  Last update: January 11th, 2024
 |  Version: 0.0.1
 |---------------------------------------------------------------------------------------
 |  Status: #In progress | #Not decorated
 |---------------------------------------------------------------------------------------
 
 */

extension Matrix where Element: SignedNumeric {
    @discardableResult
    public mutating func summationIdentical(_ direction: Matrix.Direction) -> Bool {
        //General process logic
        func sharedProcess(
            condition: ((x: Int, y: Int)) -> Bool,
            nextIndex: (_ index: Int) -> Int){
                recruscentPassage { out in
                    self.iterate { xCoordinate, yCoordinate, index in
                        if self.storage[index] != nil && condition((xCoordinate, yCoordinate)) {
                            let nextIndex = nextIndex(index)
                            if combineAndClear(from: nextIndex, to: index) {
                                self.move(direction)
                                out = false
                                isSuccess = true
                            }
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
        //Pre-movement
        self.move(direction)
        //Return value
        var isSuccess: Bool = false
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
        return isSuccess
    }
}
