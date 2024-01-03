// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let trailer = try? newJSONDecoder().decode(Trailer.self, from: jsonData)

import Foundation

// MARK: - Trailer
struct Trailer: Codable {
    let mp4240, mp4360, mp4480, mp4720: String?
    let mp41080: String?
}
