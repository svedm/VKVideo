//
//  NetworkClient.swift
//  VKVideo
//
//  Created by Svetoslav on 02.01.2024.
//

import Foundation

protocol NetworkClient {
    func get<T: Decodable>(url: URL, params: [String: String]) async throws -> T
    func post<T: Decodable>(url: URL, params: [String: String]) async throws -> T
}
