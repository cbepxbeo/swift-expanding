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
 |  File: Functions.swift
 |  Created by: Egor Boyko
 |  Date: January 10th, 2024
 |  Last update: January 10th, 2024
 |  Version: 0.0.1
 |---------------------------------------------------------------------------------------
 |  Status: #In progress | #Not decorated
 |---------------------------------------------------------------------------------------
 
 */

public func recruscentPassage(body: (_ out: inout Bool) -> ()){
    var bool = true
    body(&bool)
    if bool {
        return
    } else {
        bool = true
        recruscentPassage{ out in
            body(&out)
        }
    }
}

@inlinable
@inline(__always)
public func assign<T: Hashable>(to: inout T, of: T){
    if to != of { to = of }
}

#if canImport(Foundation)
import Foundation

public func toMainThread(
    _ type: Synchronization = .sync,
    _ closure: @escaping () -> ()){
        switch type {
        case .async:
            DispatchQueue.main.async {
                closure()
            }
        case .sync:
            if Thread.isMainThread {
                closure()
            } else {
                DispatchQueue.main.sync {
                    closure()
                }
            }
        case .after(let second):
            DispatchQueue.main.asyncAfter(deadline: .now() + second){
                closure()
            }
        }
    }
#endif

