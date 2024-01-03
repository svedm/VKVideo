// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let subtitle = try? newJSONDecoder().decode(Subtitle.self, from: jsonData)

import Foundation

// MARK: - Subtitle
struct Subtitle: Codable {
    let isAuto: Bool
    let storageIndex: Int
    let lang, title: String
    let url: String
    let manifestName: String
}
