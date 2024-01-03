// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let reposts = try? newJSONDecoder().decode(Reposts.self, from: jsonData)

import Foundation

// MARK: - Reposts
struct Reposts: Codable {
    let count: Int
    let userReposted: Int
}
