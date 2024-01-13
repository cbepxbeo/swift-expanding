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
 |  File: ExpandingMatrixOperatorsTests.swift
 |  Created by: Egor Boyko
 |  Date: January 13th, 2023
 |---------------------------------------------------------------------------------------
 
 */

import XCTest
@testable import Expanding

final class ExpandingMatrixOperatorsTests: XCTestCase {
    
    let arrayA = [1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4]
    let arrayB = [5, 6, 7, 8, 5, 6, 7, 8, 5, 6, 7, 8, 5, 6, 7, 8]
    let arrayWithOptional = [1, nil, 2, nil, 3, nil, 4, nil, 1, nil, 2, nil, 3, nil, 4, nil]
    let arrayOnlyOptional: [Int?] = .init(repeating: nil, count: 16)
    let count = 4
    
    func testOperatorPlus() throws {
        let arrayOutput = (0...15).map{ self.arrayA[$0] + self.arrayB[$0] }
        let matrixA = Matrix(column: self.count, row: self.count, storage: self.arrayA)
        let matrixB = Matrix(column: self.count, row: self.count, storage: self.arrayB)
        let matrixOutput = Matrix(column: self.count, row: self.count, storage: arrayOutput)
        
        let output = try matrixA + matrixB
        XCTAssert(output == matrixOutput)
    }
    
    func testOperatorPlusWithOptionalValues() throws {
        let matrixA = Matrix(column: self.count, row: self.count, storage: self.arrayWithOptional)
        let matrixB = Matrix(column: self.count, row: self.count, storage: self.arrayOnlyOptional)
    
        let outputA = try matrixA + matrixB
        let outputB = try matrixB + matrixA
    
        XCTAssert(outputA == matrixA)
        XCTAssert(outputB == matrixA)
    }
    
    func testOperatorPlusWithError() throws {
        let matrixA = try Matrix(column: 5, row: 5, element: Int.self)
        let matrixB = try Matrix(column: 4, row: 4, element: Int.self)

        var output: Bool = false
        do {
            let _ = try matrixA + matrixB
        } catch let error as MatrixError where error == .matricesNotIdenticalStructure {
            output = true
        }
        XCTAssert(output)
    }
    
    func testOperatorMultiplication() throws {
        let arrayOutput = (0...15).map{ self.arrayA[$0] * self.arrayB[$0] }
        let matrixA = Matrix(column: self.count, row: self.count, storage: self.arrayA)
        let matrixB = Matrix(column: self.count, row: self.count, storage: self.arrayB)
        let matrixOutput = Matrix(column: self.count, row: self.count, storage: arrayOutput)
        
        let output = try matrixA * matrixB
        XCTAssert(output == matrixOutput)
    }
    
    func testOperatorMultiplicationWithOptionalValues() throws {
        let matrixA = Matrix(column: self.count, row: self.count, storage: self.arrayWithOptional)
        let matrixB = Matrix(column: self.count, row: self.count, storage: self.arrayOnlyOptional)
    
        let outputA = try matrixA * matrixB
        let outputB = try matrixB * matrixA

        XCTAssert(outputA == matrixA)
        XCTAssert(outputB == matrixA)
    }
    
    func testOperatorMultiplicationWithError() throws {
        let matrixA = try Matrix(column: 5, row: 5, element: Int.self)
        let matrixB = try Matrix(column: 4, row: 4, element: Int.self)

        var output: Bool = false
        do {
            let _ = try matrixA * matrixB
        } catch let error as MatrixError where error == .matricesNotIdenticalStructure {
            output = true
        }
        XCTAssert(output)
    }
    
}
