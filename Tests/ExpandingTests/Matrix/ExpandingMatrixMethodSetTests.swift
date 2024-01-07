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
 |  File: ExpandingMatrixMethodSetTests.swift
 |  Created by: Egor Boyko
 |  Date: January 6th, 2023
 |---------------------------------------------------------------------------------------
 
 */

import XCTest
@testable import Expanding

final class ExpandingMatrixMethodSetTests: XCTestCase {
    static let count = 10
    let matrix = {
        let count = ExpandingMatrixMethodSetTests.count
        var matrix = Matrix(
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
        let count = ExpandingMatrixMethodSetTests.count
        var matrix = self.matrix
        try matrix.set(toSet, x: count, y: count)
        XCTAssert(matrix.storage.last == toSet)
    }
    
    func testNegativeXCoordinate() throws {
        var matrix = self.matrix
        let count = ExpandingMatrixMethodSetTests.count
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
        let count = ExpandingMatrixMethodSetTests.count
        var output: Bool = false
        do {
            try matrix.set(99, x: count, y: -1)
        } catch let error as MatrixError where error == .negativeCoordinate(message: ""){
            output = true
        }
        XCTAssert(output)
    }
    
    func testBigXCoordinate() throws {
        var matrix = self.matrix
        let count = ExpandingMatrixMethodSetTests.count
        var output: Bool = false
        do {
            try matrix.set(99, x: count + 1, y: count)
        } catch let error as MatrixError where error == .columnOfRange {
            output = true
        }
        XCTAssert(output)
    }
    
    func testBigYCoordinate() throws {
        var matrix = self.matrix
        let count = ExpandingMatrixMethodSetTests.count
        var output: Bool = false
        do {
            try matrix.set(99, x: count, y: count + 1)
        } catch let error as MatrixError where error == .rowOfRange {
            output = true
        }
        XCTAssert(output)
    }
    
    func testZeroXCoordinate() throws {
        var matrix = self.matrix
        let count = ExpandingMatrixMethodSetTests.count
        var output = false
        do {
            try matrix.set(99, x: 0, y: count)
        } catch let error as MatrixError where error == .zeroCoordinate(message: "") {
            output = true
        }
        XCTAssert(output)
    }
    
    func testZeroYCoordinate() throws {
        var matrix = self.matrix
        let count = ExpandingMatrixMethodSetTests.count
        var output: Bool = false
        do {
            try matrix.set(99, x: count, y: 0)
        } catch let error as MatrixError where error == .zeroCoordinate(message: "") {
            output = true
        }
        XCTAssert(output)
    }
    
    func testSetAll() throws {
        var matrix = self.matrix
        let count = ExpandingMatrixMethodSetTests.count
        let input = 77
        var output = true
        let range = 1...count
        
        for y in range {
            for x in range {
                try matrix.set(input, x: x, y: y)
            }
        }
        
        matrix.storage.forEach { value in
            if value != input {
                output = false
            }
        }
        XCTAssert(output)
    }
    
    
    func testSetStructure() throws {
        let count = 5
        var matrix = Matrix(column: count, row: count, storage: [0])
        var output: Bool = false
        do {
            try matrix.set(99, x: count, y: 0)
        } catch let error as MatrixError where error == .wrongStructure(message: "") {
            output = true
        }
        XCTAssert(output)
    }
    
}
