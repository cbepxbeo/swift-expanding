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
 |  File: ExpandingMatrixedTestsMethodReceiveRow.swift
 |  Created by: Egor Boyko
 |  Date: January 7th, 2023
 |---------------------------------------------------------------------------------------
 
 */

import XCTest
@testable import Expanding

final class ExpandingMatrixedTestsMethodReceiveRow: XCTestCase {
    static let count = 10
    
    let matrix = {
        let count = ExpandingMatrixedTestsMethodReceiveRow.count
        var matrix = Matrix(
            column: count,
            row: count,
            storage: (1...count * count).map{ $0 }
        )
        return matrix
    }()
    
    func testRowAll() throws {
        let matrix = self.matrix
        let count = ExpandingMatrixedTestsMethodReceiveRow.count
        let range = 1...self.matrix.row
        var output = true
        
        for row in range {
            let array: [Int?] = (((row - 1) * count) + 1...row * count).map{ $0 }
            let result = try matrix.receive(row: row)
            if result != array {
                output = false
            }
        }
        XCTAssert(output)
    }
    
}
