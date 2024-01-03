//
//  DeviceSettingsService.swift
//  VKVideo
//
//  Created by Svetoslav on 02.01.2024.
//

import Foundation

protocol DeviceSettingsService {
    func deviceId() -> String
}

final class CurrentDeviceSettingsService: DeviceSettingsService {
    private let storage = UserDefaults.standard

    private enum Keys {
        static let deviceId = "deviceId"
    }

    func deviceId() -> String {
        storage.string(forKey: Keys.deviceId) ?? createDeviceId()
    }

    private func createDeviceId() -> String {
        let id = UUID().uuidString

        storage.setValue(id, forKey: Keys.deviceId)

        return id
    }
}
