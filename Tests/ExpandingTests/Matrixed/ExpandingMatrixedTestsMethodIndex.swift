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
 |  File: ExpandingMatrixedTestsMethodIndex.swift
 |  Created by: Egor Boyko
 |  Date: January 7th, 2023
 |---------------------------------------------------------------------------------------
 
 */

import XCTest
@testable import Expanding

final class ExpandingMatrixedTestsMethodIndex: XCTestCase {
    static let count = 10
    
    let matrix = {
        let count = ExpandingMatrixedTestsMethodSet.count
        var matrix = MatrixTestInt(
            column: count,
            row: count,
            storage: .init(repeating: 0, count: count * count)
        )
        return matrix
    }()
    
    func testIndexAll() throws {
        var matrix = self.matrix
        let count = ExpandingMatrixedTestsMethodSet.count
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
        var matrix = self.matrix
        let count = ExpandingMatrixedTestsMethodSet.count
        var output: Bool = false
        do {
            let _ = try matrix.index(x: -1, y: count)
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
            let _ = try matrix.index(x: count, y: -1)
        } catch let error as MatrixError where error == .negativeCoordinate(message: ""){
            output = true
        }
        XCTAssert(output)
    }
    
}
