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
 |  File: Matrix+ComputedProperties.swift
 |  Created by: Egor Boyko
 |  Date: January 14th, 2024
 |  Last update: January 14th, 2024
 |  Version: 0.0.1
 |---------------------------------------------------------------------------------------
 |  Status: #In progress | #Not decorated
 |---------------------------------------------------------------------------------------
 
 */

extension Matrix {
    ///Number of cells in the matrix
    public var count: Int {
        self.storage.count
    }
    ///Number of elements not equal to nil
    public var countNotNil: Int {
        self.storage.compactMap{ $0 }.count
    }
    ///Number of elements equal to nil
    public var countNil: Int {
        self.storage.count - self.storage.compactMap{ $0 }.count
    }
    ///A Boolean value indicating whether the matrix contains only nil
    public var isEmpty: Bool {
        self.storage.compactMap{ $0 }.count == 0
    }
    ///Boolean value indicating that there is no zero and all cells contain a value
    public var isFull: Bool {
        self.storage.compactMap{ $0 }.count == self.storage.count
    }
}

