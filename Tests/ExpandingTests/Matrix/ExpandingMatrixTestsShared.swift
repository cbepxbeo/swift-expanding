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
 |  File: ExpandingMatrixTestsShared.swift
 |  Created by: Egor Boyko
 |  Date: January 7th, 2023
 |---------------------------------------------------------------------------------------
 
 */

import XCTest
@testable import Expanding

final class ExpandingMatrixTestsShared: XCTestCase {
    func testIterator() throws {
        func worker(column: Int, row: Int, output: inout Bool) throws {
            let matrix = Matrix(
                column: column,
                row: row,
                storage: (1...(column * row)).map{ $0 }
            )
            for (x, y, element) in matrix {
                if element != (try matrix.receive(x: x, y: y)) {
                    output = false
                }
            }
        }
        var output = true
        try (0...10).map { _ in
            let range = 1...100
            return (Int.random(in: range), Int.random(in: range))
        }.forEach { item in
            try worker(column: item.0, row: item.1, output: &output)
            try worker(column: item.1, row: item.0, output: &output)
        }
        XCTAssert(output)
    }
}
