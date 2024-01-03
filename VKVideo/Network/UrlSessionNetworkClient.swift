//
//  UrlSessionNetworkClient.swift
//  VKVideo
//
//  Created by Svetoslav on 02.01.2024.
//

import Foundation

enum NetworkError: Error {
    case badURL
}

final class UrlSessionNetworkClient: NetworkClient {
    private let userAgent = "com.vk.vkvideo.prod/358 (iPod touch, iOS 14.7.1, iPod9,1, Scale/2.0) SAK/1.109"
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private let session = URLSession.shared

    init() {
        session.configuration.httpAdditionalHeaders = [
            "User-Agent": userAgent
        ]

        decoder.keyDecodingStrategy = .convertFromSnakeCase
    }

    func get<T: Decodable>(url: URL, params: [String: String]) async throws -> T {
        guard
            var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        else { throw NetworkError.badURL }

        components.queryItems = params.map { URLQueryItem(name: $0, value: $1) }

        guard let url = components.url else { throw NetworkError.badURL }

        let request = URLRequest(url: url)

        let data = try await session.data(for: request)

        return try decoder.decode(T.self, from: data.0)
    }

    func post<T: Decodable>(url: URL, params: [String: String]) async throws -> T {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
        let body = params
            .map { "\($0)=\($1)" }.joined(separator: "&")
            .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)?
            .data(using: .utf8)
        request.httpBody = body

        let data = try await session.data(for: request)

        return try decoder.decode(T.self, from: data.0)
    }
}
