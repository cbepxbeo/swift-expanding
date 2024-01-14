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
 |  File: ExpandingMatrixMethodReceiveColumnTests.swift
 |  Created by: Egor Boyko
 |  Date: January 14th, 2023
 |---------------------------------------------------------------------------------------
 
 */

import XCTest
@testable import Expanding

final class ExpandingMatrixMethodReceiveColumnTests: XCTestCase {
    static let array = [1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4]
    
    let matrix = {
        let count = ExpandingMatrixMethodReceiveRowTests.count
        var matrix = Matrix(
            column: 4,
            row: 4,
            storage: ExpandingMatrixMethodReceiveColumnTests.array
        )
        return matrix
    }()
    
    func testColumnAll() throws {
        let matrix = self.matrix
        let range = 1...self.matrix.column
        var output = true
        
        for column in range {
            let result = try matrix.receive(column: column)
            if result != .init(repeating: column, count: self.matrix.column) {
                output = false
            }
        }
        XCTAssert(output)
    }
    
}
