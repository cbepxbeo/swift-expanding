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
 |  File: ExpandingMatrixedTestsShared.swift
 |  Created by: Egor Boyko
 |  Date: January 7th, 2023
 |---------------------------------------------------------------------------------------
 
 */

import XCTest
@testable import Expanding

final class ExpandingMatrixedTestsShared: XCTestCase {
 
    func testAddition() throws {
        
        let inputA = (1...15).map{ $0 }
        let inputB = (1...4).map{ $0 }
        
        let matrixA = Matrix(column: 5, row: 3, storage: inputA)
        let matrixB = Matrix(column: 2, row: 2, storage: inputB)
     
    }
}
