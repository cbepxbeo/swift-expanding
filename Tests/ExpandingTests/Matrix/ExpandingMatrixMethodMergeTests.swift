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
 |  File: ExpandingMatrixMethodMergeTests.swift
 |  Created by: Egor Boyko
 |  Date: January 14th, 2023
 |---------------------------------------------------------------------------------------
 
 */

import XCTest
@testable import Expanding

final class ExpandingMatrixMethodMergeTests: XCTestCase {
    
    let arrayA = [1, 2, 1, nil, nil, nil, 1, nil, 1]
    let arrayB = [1, 2, 1, nil, nil, nil, nil, 1, 1, nil, 1, nil, 1, 1, nil, 5]
    let output = [2, 4, 2, nil, nil, nil, nil, 1, 2, nil, 2, nil, 1, 1, nil, 5]

    func testWithLargerSize() throws {
        var matrixA = Matrix(column: 3, row: 3, storage: self.arrayA)
        let matrixB = Matrix(column: 4, row: 4, storage: self.arrayB)
        let output = Matrix(column: 4, row: 4, storage: self.output)
        matrixA.merge(with: matrixB)
        XCTAssert(matrixA == output)
    }
    
    func testWithSmallSize() throws {
        var matrixA = Matrix(column: 4, row: 4, storage: self.arrayB)
        let matrixB = Matrix(column: 3, row: 3, storage: self.arrayA)
        let output = Matrix(column: 4, row: 4, storage: self.output)
        matrixA.merge(with: matrixB)
        XCTAssert(matrixA == output)
    }
}
