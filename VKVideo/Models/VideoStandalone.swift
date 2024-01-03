// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let response = try? newJSONDecoder().decode(Response.self, from: jsonData)

import Foundation

// MARK: - Response
struct VideoStandalone: Codable {
    let catalog: Catalog
    let groups: [Group]
    let videos: [Video]
    let albums: [JSONAny]
    let navigationTabs: [JSONAny]
    let feedbacks: [JSONAny]
}
