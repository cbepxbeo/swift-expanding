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
 |  File: ExpandingMatrixedTestsMethodSet.swift
 |  Created by: Egor Boyko
 |  Date: January 6th, 2023
 |---------------------------------------------------------------------------------------
 
 */

import XCTest
@testable import Expanding

final class ExpandingMatrixedTestsMethodSet: XCTestCase {
    static let count = 5
    let matrix = {
        let count = ExpandingMatrixedTestsMethodSet.count
        var matrix = MatrixTestInt(
            column: count,
            row: count,
            storage: .init(repeating: 0, count: count * count)
        )
        return matrix
    }()
    
    func testSetFirstValue() throws {
        let toSet = 99
        var matrix = self.matrix
        try matrix.set(toSet, x: 1, y: 1)
        XCTAssert(matrix.storage.first == toSet)
    }
    
    func testSetLastValue() throws {
        let toSet = 99
        let count = ExpandingMatrixedTestsMethodSet.count
        var matrix = self.matrix
        try matrix.set(toSet, x: count, y: count)
        XCTAssert(matrix.storage.last == toSet)
    }
    
    func testNegativeXCoordinate() throws {
        var matrix = self.matrix
        let count = ExpandingMatrixedTestsMethodSet.count
        var output: Bool = false
        do {
            try matrix.set(99, x: -1, y: count)
        } catch let error as MatrixError where error == .negativeCoordinate(message: ""){
            output = true
        }
        XCTAssert(output)
    }
    
    func testNegativeYCoordinate() throws {
        var matrix = self.matrix
        let count = ExpandingMatrixedTestsMethodSet.count
        var output: Bool = false
        do {
            try matrix.set(99, x: count, y: -1)
        } catch let error as MatrixError where error == .negativeCoordinate(message: ""){
            output = true
        }
        XCTAssert(output)
    }
    
}
