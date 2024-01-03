//
//  AnonymTokenService.swift
//  VKVideo
//
//  Created by Svetoslav on 02.01.2024.
//

import Foundation

protocol TokenService {
    func getToken() async throws -> String
}

final class AnonymTokenService: TokenService {
    private let host = "https://api.vk.com/"

    @Injected
    private var networkClient: NetworkClient

    @Injected
    private var deviceSettings: DeviceSettingsService

    private var token: String?

    func getToken() async throws -> String {
        if let token {
            return token
        }

        let params = [
            "client_id": Constants.clientId,
            "client_secret": Constants.clientSecret,
            "device_id": deviceSettings.deviceId()
        ]

        let result: AnonymToken = try await networkClient.post(
            url: URL.fromRequired(string: host + "oauth/get_anonym_token"),
            params: params
        )

        self.token = result.token

        return result.token
    }
}
