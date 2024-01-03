//
//  Container.swift
//  VKVideo
//
//  Created by Svetoslav on 02.01.2024.
//

import Foundation

public class Container: DIContainer {
    public typealias ProtocolResolver = (Any) -> Void
    public typealias TypeResolver = () -> Any

    private let parentContainer: DIContainer?

    private var protocolResolvers: [ProtocolResolver] = []
    private var typeResolvers: [String: TypeResolver] = [:]

    static var current = Container()

    public init(parentContainer: DIContainer? = nil) {
        self.parentContainer = parentContainer
    }

    private func register(_ resolver: @escaping ProtocolResolver) {
        protocolResolvers.append(resolver)
    }

    public func register<D>(_ resolver: @escaping (inout D) -> Void) {
        register { object in
            guard var object = object as? D else { return }

            resolver(&object)
        }
    }

    public func resolve(_ object: Any?) {
        guard let object = object else { return }

        parentContainer?.resolve(object)

        protocolResolvers.forEach { resolver in
            resolver(object)
        }
    }

    private func key<D>(_ type: D.Type) -> String {
        String(reflecting: type)
    }

    public func register<D>(_ resolver: @escaping () -> D) {
        typeResolvers[key(D.self)] = resolver
    }

    public func resolve<D>() -> D? {
        typeResolvers[key(D.self)]?() as? D ?? parentContainer?.resolve()
    }
}
