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
    func testOperatorPlus() throws {
        let arrayA = [
            1, 2, 3, 4,
            1, 2, 3, 4,
            1, 2, 3, 4,
        ]
        let arrayB = [
            5, 6, 7, 8,
            5, 6, 7, 8,
            5, 6, 7, 8,
        ]
        
        let arrayOutput = [
            6, 8, 10, 12,
            6, 8, 10, 12,
            6, 8, 10, 12,
        ]
        
        let matrixA = Matrix(column: 4, row: 3, storage: arrayA)
        let matrixB = Matrix(column: 4, row: 3, storage: arrayB)
        let matrixOutput = Matrix(column: 4, row: 3, storage: arrayOutput)
        
        let output = try matrixA + matrixB
        XCTAssert(output == matrixOutput)
    }
    
    func testOperatorPlusWithOptionalValues() throws {
        let array = [
            1, 2, 3, 4,
            1, nil, 3, nil,
            1, 2, 3, 4,
        ]

        let matrixA = try Matrix(column: 4, row: 3, element: Int.self)
        let matrixB = Matrix(column: 4, row: 3, storage: array)
                
        let outputA = try matrixA + matrixB
        let outputB = try matrixB + matrixA
        XCTAssert(outputA == matrixB)
        XCTAssert(outputB == matrixB)
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
}
