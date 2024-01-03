//
//  VideoSectionInfo.swift
//  VKVideo
//
//  Created by Svetoslav on 03.01.2024.
//

import Foundation

struct VideoSectionInfo: Codable, Identifiable {
    var section: VideoSection
    var groups: [Group]
    var videos: [Video]?

    var id: String {
        section.id
    }
}
