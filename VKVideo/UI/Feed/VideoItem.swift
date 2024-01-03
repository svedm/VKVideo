//
//  VideoItem.swift
//  VKVideo
//
//  Created by Svetoslav on 03.01.2024.
//

import SwiftUI

struct VideoItem: View {
    let video: Video
    let fullSection: VideoSectionInfo
    let onTap: () -> Void
    let loadMore: (String) -> Void

    var body: some View {
        Button(
            action: {
                onTap()
            }
        ) {
            VStack {
                AsyncImage(url: video.previewURL) { image in
                    image.image?.resizable()
                        .scaledToFit()
                }
                Text(video.title)
                    .lineLimit(2)
                    .font(.caption)
            }
        }
        .onAppear {
            let videos = fullSection.videos ?? []
            let index = (videos).firstIndex(where: { $0.id == video.id })
            let next = fullSection.section.nextFrom
            if let index, index == (videos.count - 1), let next {
                loadMore(next)
            }
        }
    }
}
