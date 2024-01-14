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
 |  File: NumberSequence.swift
 |  Created by: Egor Boyko
 |  Date: January 9th, 2024
 |  Last update: January 9th, 2024
 |  Version: 0.0.1
 |---------------------------------------------------------------------------------------
 |  Status: #Completed | #Decorated
 |---------------------------------------------------------------------------------------
 
 */

public struct NumberSequence: Sequence {
    public init(_ start: Int, _ end: Int) {
        self.start = start
        self.end = end
    }
    let start: Int
    let end: Int
    public func makeIterator() -> IndexingIterator<[Int]> {
        if self.start < self.end {
            (start...end).map{$0}.makeIterator()
        } else if self.start > self.end {
            (end...start).map{$0}.sorted(by: >).makeIterator()
        } else {
            [].makeIterator()
        }
    }
}

