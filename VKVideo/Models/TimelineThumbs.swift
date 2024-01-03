// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let timelineThumbs = try? newJSONDecoder().decode(TimelineThumbs.self, from: jsonData)

import Foundation

// MARK: - TimelineThumbs
struct TimelineThumbs: Codable {
    let countPerImage, countPerRow, countTotal, frameHeight: Int
    let frameWidth: Int
    let links: [String]
    let isUv: Bool
    let frequency: Int
}
