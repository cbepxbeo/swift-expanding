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
 |  File: Matrix+Method+RearrangeWithSumIdentical.swift
 |  Created by: Egor Boyko
 |  Date: January 13th, 2024
 |  Last update: January 13th, 2024
 |  Version: 0.0.1
 |---------------------------------------------------------------------------------------
 |  Status: #Completed | #Decorated
 |---------------------------------------------------------------------------------------
 
 */

extension Matrix where Element: SignedNumeric {
    ///Rearranges elements in the specified direction with the summation of identical
    ///
    ///Example with recursive upward direction
    ///
    ///     //Row 1:          | 2 | 2 | 2 | 2 | 2 |
    ///     //Row 2:          | 2 | 2 | 2 | 2 | 2 |
    ///     //Row 3:          | 2 | 2 | 2 | 2 | 2 |
    ///     //Row 4:          | 2 | 2 | 2 | 2 | 2 |
    ///     //Row 5:          | 2 | 2 | 2 | 2 | 2 |
    ///
    ///     matrix.rearrangeWithSumIdentical(in: .upward)
    ///
    ///     //Row 1:          |  8  |  8  |  8  |  8  |  8  |
    ///     //Row 2:          |  2  |  2  |  2  |  2  |  2  |
    ///     //Row 3:          | nil | nil | nil | nil | nil |
    ///     //Row 4:          | nil | nil | nil | nil | nil |
    ///     //Row 5:          | nil | nil | nil | nil | nil |
    ///
    ///Example with upward direction
    ///
    ///     //Row 1:          | 2 | 2 | 2 | 2 | 2 |
    ///     //Row 2:          | 2 | 2 | 2 | 2 | 2 |
    ///     //Row 3:          | 2 | 2 | 2 | 2 | 2 |
    ///     //Row 4:          | 2 | 2 | 2 | 2 | 2 |
    ///     //Row 5:          | 2 | 2 | 2 | 2 | 2 |
    ///
    ///     matrix.rearrangeWithSumIdentical(in: .upward, recursively: false)
    ///
    ///     //Row 1:          |  4  |  4  |  4  |  4  |  4  |
    ///     //Row 2:          |  4  |  4  |  4  |  4  |  4  |
    ///     //Row 3:          |  2  |  2  |  2  |  2  |  2  |
    ///     //Row 4:          | nil | nil | nil | nil | nil |
    ///     //Row 5:          | nil | nil | nil | nil | nil |
    ///
    ///Example with recursive left direction
    ///
    ///     //Row 1:          | 2 | 2 | 2 | 2 | 2 |
    ///     //Row 2:          | 2 | 2 | 2 | 2 | 2 |
    ///     //Row 3:          | 2 | 2 | 2 | 2 | 2 |
    ///     //Row 4:          | 2 | 2 | 2 | 2 | 2 |
    ///     //Row 5:          | 2 | 2 | 2 | 2 | 2 |
    ///
    ///     matrix.rearrangeWithSumIdentical(in: .left)
    ///
    ///     //Row 1:          | 8 | 2 | nil | nil | nil |
    ///     //Row 2:          | 8 | 2 | nil | nil | nil |
    ///     //Row 3:          | 8 | 2 | nil | nil | nil |
    ///     //Row 4:          | 8 | 2 | nil | nil | nil |
    ///     //Row 5:          | 8 | 2 | nil | nil | nil |
    ///
    ///Example with left direction
    ///
    ///     //Row 1:          | 2 | 2 | 2 | 2 | 2 |
    ///     //Row 2:          | 2 | 2 | 2 | 2 | 2 |
    ///     //Row 3:          | 2 | 2 | 2 | 2 | 2 |
    ///     //Row 4:          | 2 | 2 | 2 | 2 | 2 |
    ///     //Row 5:          | 2 | 2 | 2 | 2 | 2 |
    ///
    ///     matrix.rearrangeWithSumIdentical(in: .left, recursively: false)
    ///
    ///     //Row 1:          | 4 | 4 | 2 | nil | nil |
    ///     //Row 2:          | 4 | 4 | 2 | nil | nil |
    ///     //Row 3:          | 4 | 4 | 2 | nil | nil |
    ///     //Row 4:          | 4 | 4 | 2 | nil | nil |
    ///     //Row 5:          | 4 | 4 | 2 | nil | nil |
    ///
    /// - Parameter direction: the direction in which neighboring elements will
    /// be rearranged and then summed
    /// - Parameter recursively: Controls the behavior of the method. If false is passed,
    /// after rearranging the elements, the summation will be performed once.
    /// If you convey the true, then summation and rearrangement will occur as long as this is possible.
    /// - Returns: Coordinates of the elements that were summedned
    @discardableResult
    public mutating func rearrangeWithSumIdentical(
        in direction: Matrix.Direction,
        recursively: Bool = true) -> [(from: Int, to: Int)] {
            var output: [(from: Int, to: Int)] = []
            self.rearrange(in: direction)
            output += self.sumIdentical(in: direction)
            if recursively {
                var cordinates = output
                while(!cordinates.isEmpty){
                    cordinates = rearrangeWithSumIdentical(
                        in: direction,
                        recursively: recursively
                    )
                    output += cordinates
                }
            } else {
                self.rearrange(in: direction)
            }
            return output
    }
}
