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
    func check(x xCoordinate: Int) throws {
        guard xCoordinate != 0 else {
            throw MatrixError.zeroCoordinate(message: "x: \(xCoordinate)")
        }
        guard xCoordinate > 0 else {
            throw MatrixError.negativeCoordinate(message: "x: \(xCoordinate)")
        }
        guard xCoordinate <= self.column else {
            throw MatrixError.columnOfRange
        }
    }
    func check(y yCoordinate: Int) throws {
        guard yCoordinate != 0 else {
            throw MatrixError.zeroCoordinate(message: "y: \(yCoordinate)")
        }
        guard yCoordinate > 0 else {
            throw MatrixError.negativeCoordinate(message: "y: \(yCoordinate)")
        }
        guard yCoordinate <= self.row else {
            throw MatrixError.rowOfRange
        }
    }
}



