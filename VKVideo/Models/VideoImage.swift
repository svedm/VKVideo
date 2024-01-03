// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let firstFrame = try? newJSONDecoder().decode(FirstFrame.self, from: jsonData)

import Foundation

// MARK: - FirstFrame
struct VideoImage: Codable {
    let url: URL
    let width: Int
    let height: Int
    let withPadding: Int?
}
