// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let params = try? newJSONDecoder().decode(Params.self, from: jsonData)

import Foundation

// MARK: - Params
struct Params: Codable {
    let vkId: String
    let duration: Int
    let videoId: String
    let pl: Int
    let contentId: String
    let lang, puid1, puid2, puid3: Int
    let puid4, puid5, puid6, puid7: Int
    let puid8, puid9, puid10, puid12: Int
    let puid13, puid14, puid15, puid18: Int
    let puid21, groupId, vkCatid: Int
    let vkContentMarkIds: [Int]?
    let isXzVideo: Int?
}
