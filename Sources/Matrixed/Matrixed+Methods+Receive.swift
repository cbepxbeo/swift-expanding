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
 |  File: Matrixed+Methods+Receive.swift
 |  Created by: Egor Boyko
 |  Date: January 5th, 2024
 |  Last update: January 6th, 2024
 |  Version: 0.0.1
 |---------------------------------------------------------------------------------------
 |  Status: #In progress | #Not decorated
 |---------------------------------------------------------------------------------------
 
 */

extension Matrixed {
    public func receive(x xCoordinate: Int, y yCoordinate: Int) throws -> Optional<Element> {
        try self.storage[self.index(x: xCoordinate, y: yCoordinate)]
    }
    
    public func receive(index: Int) throws -> Optional<Element> {
        try self.checkStructure()
        if (index > self.storage.count - 1) || index < 0 {
            throw MatrixError.indexOfRange
        }
        return self.storage[index]
    }
    
    public func receive(row input: Int) throws -> [Optional<Element>] {
        try self.checkStructure()
        try self.check(y: input)
        let start = self.column * (input - 1)
        let end = start + self.column
        return .init(self.storage[start..<end])
    }
    
    public func receive(column input: Int) throws -> [Optional<Element>] {
        try self.checkStructure()
        try self.check(x: input)
        var temp: [Optional<Element>] = []
        for row in 1...self.row {
            temp.append(
                self.storage[input - 1 + (self.column * (row - 1))]
            )
        }
        return temp
    }
    
}

