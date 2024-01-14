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
 |  File: ExpandingMatrixComputedPropertyTests.swift
 |  Created by: Egor Boyko
 |  Date: January 14th, 2023
 |---------------------------------------------------------------------------------------
 
 */

import XCTest
@testable import Expanding

final class ExpandingMatrixComputedPropertyTests: XCTestCase {
    let matrix = try! Matrix(column: 5, row: 5, element: Int.self)
    
    func testIsEmpty() throws {
        var testable = self.matrix
        XCTAssert(testable.isEmpty)
        try testable.set(5, x: 1, y: 1)
        XCTAssert(!testable.isEmpty)
    }
    
    func testIsFull() throws {
        var matrix = try Matrix(column: 5, row: 5, defaultValue: 0)
        XCTAssert(matrix.isFull)
        try matrix.remove(x: 2, y: 2)
        XCTAssert(!matrix.isFull)
    }
    
    func testCountNotNil() throws {
        var testable = self.matrix
        XCTAssert(testable.countNotNil == 0)
        try testable.set(5, x: 1, y: 1)
        XCTAssert(testable.countNotNil == 1)
    }
    
    func testCountNil() throws {
        var testable = self.matrix
        XCTAssert(testable.countNil == 25)
        try testable.set(5, x: 1, y: 1)
        XCTAssert(testable.countNil == 24)
    }
    
}
