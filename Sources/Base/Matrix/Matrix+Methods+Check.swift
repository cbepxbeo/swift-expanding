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
 |  File: Matrix+Methods+Check.swift
 |  Created by: Egor Boyko
 |  Date: January 7th, 2024
 |  Last update: January 7th, 2024
 |  Version: 0.0.1
 |---------------------------------------------------------------------------------------
 |  Status: #In progress | #Not decorated
 |---------------------------------------------------------------------------------------
 
 */

extension Matrix {
    
    @discardableResult
    public func check(x xCoordinate: Int) throws -> Bool{
        guard xCoordinate != 0 else {
            throw MatrixError.zeroCoordinate("x: \(xCoordinate)")
        }
        guard xCoordinate > 0 else {
            throw MatrixError.negativeCoordinate("x: \(xCoordinate)")
        }
        guard xCoordinate <= self.column else {
            throw MatrixError.columnOfRange(xCoordinate)
        }
        return true
    }
    
    @discardableResult
    public func check(y yCoordinate: Int) throws -> Bool{
        guard yCoordinate != 0 else {
            throw MatrixError.zeroCoordinate("y: \(yCoordinate)")
        }
        guard yCoordinate > 0 else {
            throw MatrixError.negativeCoordinate("y: \(yCoordinate)")
        }
        guard yCoordinate <= self.row else {
            throw MatrixError.rowOfRange(yCoordinate)
        }
        return true
    }
    
    @discardableResult
    public func check(index: Int) throws -> Bool{
        if (index > self.storage.count - 1) || index < 0 {
            throw MatrixError.indexOfRange
        }
        return true
    }
}



