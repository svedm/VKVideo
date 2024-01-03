//
//  AnonymToken.swift
//  VKVideo
//
//  Created by Svetoslav on 02.01.2024.
//

import Foundation

struct AnonymToken: Decodable {
    let token: String
    let expiredAt: Int
}
