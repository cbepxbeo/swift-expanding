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
 |  File: Matrix+Method+ForEach.swift
 |  Created by: Egor Boyko
 |  Date: January 5th, 2024
 |  Last update: January 7th, 2024
 |  Version: 0.0.1
 |---------------------------------------------------------------------------------------
 |  Status: #In progress | #Not decorated
 |---------------------------------------------------------------------------------------
 
 */

extension Matrix {
    public func forEach(
        direction: IterationDirection = .upToDown,
        handler: (
            _ xCoordinate: Int,
            _ yCoordinate: Int,
            _ element: Optional<Element>) -> ()) {
                self.iterate(direction: direction) { xCoordinate, yCoordinate, index in
                    handler(xCoordinate, yCoordinate, self.storage[index])
                }
            }
}

