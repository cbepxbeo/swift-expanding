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
 |  File: Matrix+Method+IterateRecursively.swift
 |  Created by: Egor Boyko
 |  Date: January 11th, 2024
 |  Last update: January 11th, 2024
 |  Version: 0.0.1
 |---------------------------------------------------------------------------------------
 |  Status: #Completed | #Decorated
 |---------------------------------------------------------------------------------------
 
 */

extension Matrix {
    ///Recursively iterates through all elements, passing a pass-through parameter to exit into the body of the passed block.
    /// - Parameter block: A block that will be executed for each matrix element with access to coordinates and index
    /// - Note: Unlike the classical approach to recursion, the method requires set false
    /// in the end-to-end parameter, otherwise execution will stop
    public func iterateRecursively(
        block: (_ x: Int, _ y: Int, _ index: Int, _ out: inout Bool) -> ()){
        recruscentPassage { out in
            self.iterate { x, y, index in
                block(x, y, index, &out)
            }
        }
    }
}
