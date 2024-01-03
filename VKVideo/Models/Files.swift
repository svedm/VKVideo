// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let files = try? newJSONDecoder().decode(Files.self, from: jsonData)

import Foundation

// MARK: - Files
struct Files: Codable {
    let mp4144: URL?
    let mp4240: URL?
    let mp4360: URL?
    let mp4480: URL?
    let mp4720: URL?
    let mp41080: URL?
    let mp41440: URL?
    let mp42160: URL?
    let hls: URL
    let dashSep, dashWebm: String?
    let failoverHost: String?
    let dashWebmAv1: String?

    var maxMp4: URL? {
        if let mp42160 {
            return mp42160
        }
        if let mp41440 {
            return mp41440
        }
        if let mp41080 {
            return mp41080
        }
        if let mp4720 {
            return mp4720
        }
        if let mp4480 {
            return mp4480
        }
        if let mp4360 {
            return mp4360
        }
        if let mp4240 {
            return mp4240
        }
        if let mp4144 {
            return mp4144
        }

        return nil
    }
}
