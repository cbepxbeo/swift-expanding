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
        switch direction {
        case .up:
            self.up()
        case .down:
            self.down()
        case .left:
            //
            break
        case .right:
            //
            break
        }
    }
    
    
    mutating func up(){
        var bool = false
        for currentRow in 1...self.row{
            for currentColumn in 1...self.column {
                let currentIndex = currentColumn - 1 + (self.column * (currentRow - 1))
                if self.storage[currentIndex] == nil && currentRow < self.row {
                    let nextIndex = currentIndex + self.column
                    if self.storage[nextIndex] != nil {
                        self.storage[currentIndex] = self.storage[nextIndex]
                        self.storage[nextIndex] = nil
                        bool = true
                    }
                }
            }
        }
        if !bool {
            return
        } else {
            bool = false
            self.up()
        }
    }
    
    
    mutating func down(){
        var bool = false
        let invertedArray = (1...self.row).map{ $0 }.sorted(by: >)
        for currentRow in invertedArray{
            for currentColumn in 1...self.column {
                let currentIndex = currentColumn - 1 + (self.column * (currentRow - 1))
                if self.storage[currentIndex] == nil && currentRow > 1 {
                    let nextIndex = currentIndex - self.column
                    if self.storage[nextIndex] != nil {
                        self.storage[currentIndex] = self.storage[nextIndex]
                        self.storage[nextIndex] = nil
                        bool = true
                    }
                }
            }
        }
        if !bool {
            return
        } else {
            bool = false
            self.down()
        }
    }
    
    
}

