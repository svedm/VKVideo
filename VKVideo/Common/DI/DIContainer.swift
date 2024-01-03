//
//  DIContainer.swift
//  VKVideo
//
//  Created by Svetoslav on 02.01.2024.
//

import Foundation

public protocol DIContainer {
    func resolve(_ object: Any?)
    func resolve<D>() -> D?
}

public extension DIContainer {
    func resolveOrDie<D>() -> D? {
        guard let result: D = resolve() else { fatalError("Couldn't resolve dependency \(D.self)") }
        return result
    }

    func resolveOrDie<D>() -> D {
        guard let result: D = resolve() else { fatalError("Couldn't resolve dependency \(D.self)") }
        return result
    }
}
