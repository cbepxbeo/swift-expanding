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
 |  File: ExpandingMatrixMethodRearrangementTests.swift
 |  Created by: Egor Boyko
 |  Date: January 11th, 2023
 |---------------------------------------------------------------------------------------
 
 */

import XCTest
@testable import Expanding

final class ExpandingMatrixMethodRearrangementTests: XCTestCase {
    func testDownward() throws {
        let input: [Int?] = [
            1,      nil,    1,      nil,    nil,    1,
            nil,    nil,    nil,    1,      nil,    nil,
            nil,    nil,    1,      nil,    nil,    nil,
            nil,    nil,    nil,    1,      nil,    nil,
            nil,    nil,    1,      nil,    nil,    nil,
            1,      nil,    nil,    1,      nil,    1,
        ]
        let output: [Int?] = [
            nil,    nil,    nil,    nil,    nil,    nil,
            nil,    nil,    nil,    nil,    nil,    nil,
            nil,    nil,    nil,    nil,    nil,    nil,
            nil,    nil,    1,      1,      nil,    nil,
            1,      nil,    1,      1,      nil,    1,
            1,      nil,    1,      1,      nil,    1,
        ]
        var matrix = Matrix(column: 6, row: 6, storage: input)
        matrix.rearrangement(in: .downward)
        XCTAssert(matrix.storage == output)
    }
    func testUpward() throws {
        let input: [Int?] = [
            1,      nil,    1,      nil,    nil,    1,
            nil,    nil,    nil,    1,      nil,    nil,
            nil,    nil,    1,      nil,    nil,    nil,
            nil,    nil,    nil,    1,      nil,    nil,
            nil,    nil,    1,      nil,    nil,    nil,
            1,      nil,    nil,    1,      nil,    1,
        ]
        let output: [Int?] = [
            1,      nil,    1,      1,      nil,    1,
            1,      nil,    1,      1,      nil,    1,
            nil,    nil,    1,      1,      nil,    nil,
            nil,    nil,    nil,    nil,    nil,    nil,
            nil,    nil,    nil,    nil,    nil,    nil,
            nil,    nil,    nil,    nil,    nil,    nil,
        ]
        var matrix = Matrix(column: 6, row: 6, storage: input)
        matrix.rearrangement(in: .upward)
        XCTAssert(matrix.storage == output)
    }
    func testLeft() throws {
        let input: [Int?] = [
            1,      nil,    nil,    nil,    nil,    1,
            nil,    nil,    nil,    nil,    nil,    nil,
            1,      nil,    1,      nil,    1,      nil,
            nil,    1,      nil,    1,      nil,    1,
            nil,    nil,    nil,    nil,    nil,    nil,
            1,      nil,    nil,    nil,    nil,    1,
        ]
        let output: [Int?] = [
            1,      1,      nil,    nil,    nil,    nil,
            nil,    nil,    nil,    nil,    nil,    nil,
            1,      1,      1,      nil,    nil,    nil,
            1,      1,      1,      nil,    nil,    nil,
            nil,    nil,    nil,    nil,    nil,    nil,
            1,      1,      nil,    nil,    nil,    nil,
        ]
        var matrix = Matrix(column: 6, row: 6, storage: input)
        matrix.rearrangement(in: .left)
        XCTAssert(matrix.storage == output)
    }
    func testRight() throws {
        let input: [Int?] = [
            1,      nil,    nil,    nil,    nil,    1,
            nil,    nil,    nil,    nil,    nil,    nil,
            1,      nil,    1,      nil,    1,      nil,
            nil,    1,      nil,    1,      nil,    1,
            nil,    nil,    nil,    nil,    nil,    nil,
            1,      nil,    nil,    nil,    nil,    1,
        ]
        let output: [Int?] = [
            nil,    nil,    nil,    nil,    1,      1,
            nil,    nil,    nil,    nil,    nil,    nil,
            nil,    nil,    nil,    1,      1,      1,
            nil,    nil,    nil,    1,      1,      1,
            nil,    nil,    nil,    nil,    nil,    nil,
            nil,    nil,    nil,    nil,    1,      1,
        ]
        var matrix = Matrix(column: 6, row: 6, storage: input)
        matrix.rearrangement(in: .right)
        XCTAssert(matrix.storage == output)
    }
}
