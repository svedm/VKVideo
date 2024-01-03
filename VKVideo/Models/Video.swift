// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let video = try? newJSONDecoder().decode(Video.self, from: jsonData)

import Foundation

// MARK: - Video
struct Video: Codable, Identifiable {
    let id: Int
    let files: Files
    let trailer: Trailer?
    let timelineThumbs: TimelineThumbs?
    let canBePinned, isPinned: Bool
    let responseType: String
    let canLike, canRepost, canSubscribe, canAddToFaves: Int?
    let canAdd, canPlayInBackground, canDownload, comments: Int?
    let date: Int
    let description: String
    let duration: Int
    let image: [VideoImage]
    let firstFrame: [VideoImage]?
    let width: Int
    let height: Int
    let ownerId: Int
    let ovId: String
    let title: String
    let player: String
    let added: Int
    let trackCode: String
    let videoRepeat: Int?
    let type: String
    let views, localViews: Int?
    let likes: Likes?
    let reposts: Reposts?
    let uvStatsPlace: String?
    let canDislike: Int?
    let liveStatus: String?
    let hasSubtitles: Int?
    let subtitles: [Subtitle]?

    var previewURL: URL? {
        image.first(where: { $0.width == 720 })?.url ?? image.first?.url
    }
}
