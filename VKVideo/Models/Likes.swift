// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let likes = try? newJSONDecoder().decode(Likes.self, from: jsonData)

import Foundation

// MARK: - Likes
struct Likes: Codable {
    let count: Int
    let userLikes: Int
}
