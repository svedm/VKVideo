//
//  Injected.swift
//  VKVideo
//
//  Created by Svetoslav on 02.01.2024.
//

import Foundation

@propertyWrapper
struct Injected<Value> {
    var wrappedValue: Value {
        Container.current.resolveOrDie()
    }
}
