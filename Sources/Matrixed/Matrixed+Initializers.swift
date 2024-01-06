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
 |  File: Matrixed+Initializers.swift
 |  Created by: Egor Boyko
 |  Date: January 6th, 2024
 |  Last update: January 6th, 2024
 |  Version: 0.0.1
 |---------------------------------------------------------------------------------------
 |  Status: #In progress | #Not decorated
 |---------------------------------------------------------------------------------------
 
 */

extension Matrixed {
    public init(column: Int, row: Int, element type: Element.Type){
        self.init(
            column: column,
            row: row,
            storage: .init(repeating: Optional<Element>.none, count: column * row)
        )
    }

    public init(column: Int, row: Int, defaultValue value: Element){
        self.init(
            column: column,
            row: row,
            storage: .init(repeating: value, count: column * row)
        )
    }
}

