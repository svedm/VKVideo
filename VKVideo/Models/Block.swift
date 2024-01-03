// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let block = try? newJSONDecoder().decode(Block.self, from: jsonData)

import Foundation

// MARK: - Block
struct Block: Codable {
    let id: String
    let dataType: String
    let layout: Layout
    let nextFrom: String?
//    let videosIds: [String]
    let title: String?
}
