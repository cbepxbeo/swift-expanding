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
 |  File: Matrix.swift
 |  Created by: Egor Boyko
 |  Date: January 5th, 2024
 |  Last update: January 13th, 2024
 |  Version: 0.0.1
 |---------------------------------------------------------------------------------------
 |  Status: #In progress | #Not decorated
 |---------------------------------------------------------------------------------------
 
 */

///Two-dimensional array with a known size. Similar to a dictionary, when accessing coordinates for which
///there is no element, an optional value is returned.
///
///You can create a matrix by specifying the type that will be contained without filling in the values
///
///     let matrix = try? Matrix(column: 4, row: 5, element: Int.self)
///
///     //Row 1:          | nil | nil | nil | nil |
///     //Row 2:          | nil | nil | nil | nil |
///     //Row 3:          | nil | nil | nil | nil |
///     //Row 4:          | nil | nil | nil | nil |
///     //Row 4:          | nil | nil | nil | nil |
///
///You can also create a matrix filled with default values
///
///     let matrix = try? Matrix(column: 4, row: 5, defaultValue: 0)
///
///     //Row 1:          | 0 | 0 | 0 | 0 |
///     //Row 2:          | 0 | 0 | 0 | 0 |
///     //Row 3:          | 0 | 0 | 0 | 0 |
///     //Row 4:          | 0 | 0 | 0 | 0 |
///     //Row 4:          | 0 | 0 | 0 | 0 |
///
/// - Note: A matrix is a data structure and although some mathematical operations
/// are supported, this type should not be confused with a matrix in algebra.
public struct Matrix<Element> {
    internal(set) public var column: Int
    internal(set) public var row: Int
    var storage: [Optional<Element>]
 
}

