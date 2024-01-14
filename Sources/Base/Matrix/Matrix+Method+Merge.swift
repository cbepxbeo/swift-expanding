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
 |  File: Matrix+Method+Merge.swift
 |  Created by: Egor Boyko
 |  Date: January 13th, 2024
 |  Last update: January 13th, 2024
 |  Version: 0.0.1
 |---------------------------------------------------------------------------------------
 |  Status: #In progress | #Not decorated
 |---------------------------------------------------------------------------------------
 
 */

extension Matrix where Element: SignedNumeric {
    ///Merging with another matrix. The method allows merging with a matrix of a larger or smaller size.
    public mutating func merge(with matrix: Self){
        let column = Swift.max(self.column, matrix.column)
        let row = Swift.max(self.row, matrix.row)
        var result = try! Matrix(column: column, row: row, element: Element.self)
        self.forEach { x, y, element in
            if let element {
                try? result.addTo(element, x: x, y: y)
            }
        }
        matrix.forEach { x, y, element in
            if let element {
                try? result.addTo(element, x: x, y: y)
            }
        }
        self = result
    }
    
    public var count: Int {
        self.storage.count
    }
    
    public mutating func mergearray(with matrix: Self){
        func processing(a: [Element?], b: [Element?]) -> [Element?]{
            var temp: [Element?] = a
            let limit = b.count - 1
            for index in 0...a.count - 1 {
                if index == limit { break }
                if let elementB = b[index] {
                    temp[index] = (a[index] ?? 0) + elementB
                }
            }
            return temp
        }
        
        if self.count > matrix.count {
            self = Matrix(
                column: self.column,
                row: self.row,
                storage: processing(a: self.storage, b: matrix.storage)
            )
            
        } else {
            self = Matrix(
                column: matrix.column,
                row: matrix.row,
                storage: processing(a: matrix.storage, b: self.storage)
            )
        }
    }
}

