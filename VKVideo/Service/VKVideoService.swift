//
//  VKVideoService.swift
//  VKVideo
//
//  Created by Svetoslav on 02.01.2024.
//

import Foundation

protocol VideoService {
    func catalogVideoStandalone() async throws -> VideoStandalone
    func section(id: String, from: String?) async throws -> VideoSectionInfo
    func search(query: String) async throws -> VideoSearch
}

extension VideoService {
    func section(id: String) async throws -> VideoSectionInfo {
        try await section(id: id, from: nil)
    }
}

final class VKVideoService: VideoService {
    private let host = "https://api.vk.com/method/"

    @Injected
    var networkClient: NetworkClient

    @Injected
    var tokenService: TokenService

    @Injected
    var deviceSettings: DeviceSettingsService

    func catalogVideoStandalone() async throws -> VideoStandalone {
        let token = try await tokenService.getToken()

        let params = [
            "anonymous_token": token,
            "catalog_id": "home",
            "is_ptr": "0",
            "lang": "ru",
            "need_blocks": "1",
            "v": Constants.version
        ]

        let response: APIResponse<VideoStandalone> = try await networkClient.get(
            url: URL.fromRequired(string: host + "catalog.getVideoStandalone"),
            params: params
        )

        return response.response
    }

    func section(id: String, from: String?) async throws -> VideoSectionInfo {
        let token = try await tokenService.getToken()

        var params = [
            "anonymous_token": token,
            "count": "100",
            "device_id": deviceSettings.deviceId(),
            "lang": "ru",
            "section_id": id,
            "v": Constants.version
        ]

        if let from {
            params["start_from"] = from
        }

        let response: APIResponse<VideoSectionInfo> = try await networkClient.get(
            url: URL.fromRequired(string: host + "catalog.getSection"),
            params: params
        )

        return response.response
    }

    func search(query: String) async throws -> VideoSearch {
        let token = try await tokenService.getToken()

        let params = [
            "anonymous_token": token,
            "is_ptr": "0",
            "lang": "ru",
            "live": "0",
            "need_blocks": "1",
            "no_spellcheck": "0",
            "q": query,
            "query": query,
            "screen_ref": "search_video_service",
            "search_own": "1",
            "sort": "2",
            "v": Constants.version
        ]

        let response: APIResponse<VideoSearch> = try await networkClient.get(
            url: URL.fromRequired(string: host + "catalog.getVideoSearch"),
            params: params
        )

        return response.response
    }
}
