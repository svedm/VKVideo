// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let group = try? newJSONDecoder().decode(Group.self, from: jsonData)

import Foundation

// MARK: - Group
struct Group: Codable {
    let id, membersCount: Int
    let activity: String
    let trending: Int
    let name, screenName: String
    let isClosed: Int
    let type: String
    let verified: Int
    let photo50, photo100, photo200, photoBase: String
}
