//
//  Configurator.swift
//  VKVideo
//
//  Created by Svetoslav on 02.01.2024.
//

import Foundation

struct Configurator {
    private let container: Container

    init(container: Container) {
        self.container = container
    }
    func setup() {
        registerServices()
    }

    private func registerServices() {
        container.register { () -> NetworkClient in UrlSessionNetworkClient() }
        container.register { () -> DeviceSettingsService in CurrentDeviceSettingsService() }
        let tokenService = AnonymTokenService()
        container.register { () -> TokenService in tokenService }
        container.register { () -> VideoService in VKVideoService() }
    }
}
