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
 |  File: Matrix+Static+Method+CheckColumnAndRowCount.swift
 |  Created by: Egor Boyko
 |  Date: January 7th, 2024
 |  Last update: January 7th, 2024
 |  Version: 0.0.1
 |---------------------------------------------------------------------------------------
 |  Status: #In progress | #Not decorated
 |---------------------------------------------------------------------------------------
 
 */

extension Matrix {
    static func checkColumnAndRowCount(column: Int, row: Int) throws {
        guard column > 0 else {
            throw MatrixError
                .wrongStructure("there cannot be less than one column")
        }
        guard row > 0 else {
            throw MatrixError
                .wrongStructure("there cannot be less than one row")
        }
    }
}

