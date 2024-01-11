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
 |  File: ExpandingMatrixMethodSummationIdenticalTests.swift
 |  Created by: Egor Boyko
 |  Date: January 11th, 2023
 |---------------------------------------------------------------------------------------
 
 */

import XCTest
@testable import Expanding

final class ExpandingMatrixMethodSummationIdenticalTests: XCTestCase {
    func testUpward() throws {
//        let input: [Int?] = [
//            1,      nil,    2,      nil,    nil,    1,
//            nil,    nil,    2,    1,      nil,    nil,
//            nil,    nil,    2,      nil,    nil,    nil,
//            nil,    nil,    2,    1,      nil,    nil,
//            nil,    nil,    2,      nil,    nil,    nil,
//            1,      nil,    2,    1,      nil,    1,
//        ]
//        let input: [Int?] = [
//            nil, 1, nil, nil,
//            nil, 1, 2, nil,
//            nil, nil, nil, nil,
//            nil, 2, 2, nil,
//            nil, 1, nil, nil,
//        ]
        let input: [Int?] = [
            7, 1, 7, 7,
            7, 7, 7, 7,
            7, 1, 7, 7,
            7, 7, 7, 7,
            7, 2, 7, 7,
        ]
        var matrix = Matrix(column: 4, row: 5, storage: input)
        //matrix.summationIdentical(.upward)
        //print( matrix.summationIdentical(.upward))
        print(matrix.summationIdentical(.left, emptyCell: 7))
        print(matrix)
        print(matrix.summationIdentical(.upward))
        //XCTAssert(matrix.storage == output)
    }
}
