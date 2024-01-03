// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let catalog = try? newJSONDecoder().decode(Catalog.self, from: jsonData)

import Foundation

// MARK: - Catalog
struct Catalog: Codable {
    let defaultSection: String?
    let sections: [VideoSection]
    let pinnedSection: String?
}
