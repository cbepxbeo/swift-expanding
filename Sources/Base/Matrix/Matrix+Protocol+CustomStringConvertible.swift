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
 |  File: Matrix+Protocol+CustomStringConvertible.swift
 |  Created by: Egor Boyko
 |  Date: January 7th, 2024
 |  Last update: January 6th, 2024
 |  Version: 0.0.1
 |---------------------------------------------------------------------------------------
 |  Status: #In progress | #Not decorated
 |---------------------------------------------------------------------------------------
 
 */

extension Matrix: CustomStringConvertible {
    public var description: String {
        var str: String = ""
        str += "Matrix: \n"
        str += "Stored values type: \(Element.self) \n"
        str += "Rows: \(self.row) \n"
        str += "Columns: \(self.column) \n"
        str += "________ \n \n"
        
        for currentColumn in 1...self.row {
            str += currentColumn > 9 ?
                "Row \(currentColumn): \t|" : "Row \(currentColumn): \t \t|"
            for currentRow in 1...self.column {
                do {
                    let result = try self.receive(x: currentRow, y: currentColumn)
                    if result != nil {
                        str += " \(result!) |"
                    } else {
                        str += " nil |"
                    }
                } catch {
                    str += " error |"
                }
            }
            str += " \n"
        }
        return str
    }
}
