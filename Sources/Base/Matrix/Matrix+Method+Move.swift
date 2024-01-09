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
 |  Last update: January 9th, 2024
 |  Version: 0.0.1
 |---------------------------------------------------------------------------------------
 |  Status: #In progress | #Not decorated
 |---------------------------------------------------------------------------------------
 
 */

extension Matrix where Element: SignedNumeric {
    public mutating func move(_ direction: Direction) {
        func recruscentPassage(block: (_ out: inout Bool) -> ()){
            var bool = true
            block(&bool)
            if bool {
                return
            } else {
                bool = true
                recruscentPassage{ out in
                    block(&out)
                }
            }
        }
        switch direction {
        case .up:
            recruscentPassage { out in
                self.up(out: &out)
            }
        case .down:
            recruscentPassage { out in
                self.down(out: &out)
            }
        case .left:
            recruscentPassage { out in
                self.left(out: &out)
            }
        case .right:
            recruscentPassage { out in
                self.right(out: &out)
            }
        }
    }

    mutating func up(out: inout Bool){
        self.iterate(direction: .downToUp) { xCoordinate, yCoordinate, index in
            if self.storage[index] == nil && yCoordinate < self.row {
                let nextIndex = index + self.column
                if self.storage[nextIndex] != nil {
                    self.storage[index] = self.storage[nextIndex]
                    self.storage[nextIndex] = nil
                    out = false
                }
            }
        }
    }

    mutating func down(out: inout Bool){
        self.iterate(direction: .upToDown) { xCoordinate, yCoordinate, index in
            if self.storage[index] == nil && yCoordinate > 1 {
                let nextIndex = index - self.column
                if self.storage[nextIndex] != nil {
                    self.storage[index] = self.storage[nextIndex]
                    self.storage[nextIndex] = nil
                    out = false
                }
            }
        }
    }
    
    mutating func left(out: inout Bool){
        self.iterate(direction: .rightToLeft) { xCoordinate, yCoordinate, index in
            if self.storage[index] == nil && xCoordinate < self.column {
                let nextIndex = index + 1
                if self.storage[nextIndex] != nil {
                    self.storage[index] = self.storage[nextIndex]
                    self.storage[nextIndex] = nil
                    out = false
                }
            }
        }
    }
    
    mutating func right(out: inout Bool){
        self.iterate(direction: .leftToRight) { xCoordinate, yCoordinate, index in
            if self.storage[index] == nil && xCoordinate > 1 {
                let nextIndex = index - 1
                if self.storage[nextIndex] != nil {
                    self.storage[index] = self.storage[nextIndex]
                    self.storage[nextIndex] = nil
                    out = false
                }
            }
        }
    }
}

