// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let videoStandaloneResponse = try? newJSONDecoder().decode(VideoStandaloneResponse.self, from: jsonData)

import Foundation

// MARK: - APIResponse
struct APIResponse<T: Codable>: Codable {
    let response: T
}
