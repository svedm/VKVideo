// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let sectionClass = try? newJSONDecoder().decode(SectionClass.self, from: jsonData)

import Foundation

// MARK: - SectionClass
struct VideoSection: Codable, Identifiable {
    var id: String
    var title: String
    var blocks: [Block]?
    var nextFrom: String?
    var url: String?
    var actions: [JSONAny]?
}
