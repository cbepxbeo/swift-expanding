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
 |  File: ExpandingMatrixMethodIndexTests.swift
 |  Created by: Egor Boyko
 |  Date: January 7th, 2023
 |---------------------------------------------------------------------------------------
 
 */

import XCTest
@testable import Expanding

final class ExpandingMatrixMethodIndexTests: XCTestCase {
    static let count = 10
    
    let matrix = {
        let count = ExpandingMatrixMethodIndexTests.count
        var matrix = Matrix(
            column: count,
            row: count,
            storage: .init(repeating: 0, count: count * count)
        )
        return matrix
    }()
    
    func testIndexAll() throws {
        var matrix = self.matrix
        let count = ExpandingMatrixMethodIndexTests.count
        let range = 1...count
        var output = true
        
        matrix.storage = (0..<matrix.storage.count).map{ $0 }
 
        for y in range {
            for x in range {
                let index = try matrix.index(x: x, y: y)
                if index != matrix.storage[index] {
                    output = false
                }
            }
        }
        
        XCTAssert(output)
    }
    
    func testNegativeXCoordinate() throws {
        let matrix = self.matrix
        let count = ExpandingMatrixMethodIndexTests.count
        var output: Bool = false
        do {
            let _ = try matrix.index(x: -1, y: count)
        } catch let error as MatrixError where error == .negativeCoordinate(""){
            output = true
        }
        XCTAssert(output)
    }
    
    func testNegativeYCoordinate() throws {
        let matrix = self.matrix
        let count = ExpandingMatrixMethodIndexTests.count
        var output: Bool = false
        do {
            let _ = try matrix.index(x: count, y: -1)
        } catch let error as MatrixError where error == .negativeCoordinate(""){
            output = true
        }
        XCTAssert(output)
    }
    
    func testBigXCoordinate() throws {
        let matrix = self.matrix
        let count = ExpandingMatrixMethodIndexTests.count
        var output: Bool = false
        do {
            let _ = try matrix.index(x: count + 1, y: count)
        } catch let error as MatrixError where error == .columnOfRange(0) {
            output = true
        }
        XCTAssert(output)
    }
    
    func testBigYCoordinate() throws {
        let matrix = self.matrix
        let count = ExpandingMatrixMethodIndexTests.count
        var output: Bool = false
        do {
            let _ = try matrix.index(x: count, y: count + 1)
        } catch let error as MatrixError where error == .rowOfRange(0) {
            output = true
        }
        XCTAssert(output)
    }
    
    func testZeroXCoordinate() throws {
        let matrix = self.matrix
        let count = ExpandingMatrixMethodIndexTests.count
        var output = false
        do {
            let _ = try matrix.index(x: 0, y: count)
        } catch let error as MatrixError where error == .zeroCoordinate("") {
            output = true
        }
        XCTAssert(output)
    }
    
    func testZeroYCoordinate() throws {
        let matrix = self.matrix
        let count = ExpandingMatrixMethodIndexTests.count
        var output: Bool = false
        do {
            let _ = try matrix.index(x: count, y: 0)
        } catch let error as MatrixError where error == .zeroCoordinate("") {
            output = true
        }
        XCTAssert(output)
    }
}
