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
 |  File: Matrixed+Method+Index.swift
 |  Created by: Egor Boyko
 |  Date: January 5th, 2024
 |  Last update: January 6th, 2024
 |  Version: 0.0.1
 |---------------------------------------------------------------------------------------
 |  Status: #In progress | #Not decorated
 |---------------------------------------------------------------------------------------
 
 */

extension Matrixed {
    public func index(x xCoordinate: Int, y yCoordinate: Int) throws -> Int {
        try self.check()
        
        guard xCoordinate != 0 else {
            throw MatrixError.zeroCoordinate(message: "x: \(xCoordinate)")
        }
        guard yCoordinate != 0 else {
            throw MatrixError.zeroCoordinate(message: "y: \(yCoordinate)")
        }
        guard xCoordinate > 0 else {
            throw MatrixError.negativeCoordinate(message: "x: \(xCoordinate)")
        }
        guard yCoordinate > 0 else {
            throw MatrixError.negativeCoordinate(message: "y: \(yCoordinate)")
        }
        guard xCoordinate > self.column else {
            throw MatrixError.columnOfRange
        }
        guard yCoordinate > self.row else {
            throw MatrixError.rowOfRange
        }
        return xCoordinate - 1 + (self.column * (yCoordinate - 1))
    }
}

