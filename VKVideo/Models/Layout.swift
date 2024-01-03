// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let layout = try? newJSONDecoder().decode(Layout.self, from: jsonData)

import Foundation

// MARK: - Layout
struct Layout: Codable {
    let name: String
    let itemsIgnorable: Int?
}
