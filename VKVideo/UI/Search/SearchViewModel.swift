//
//  SearchViewModel.swift
//  VKVideo
//
//  Created by Svetoslav on 03.01.2024.
//

import SwiftUI
import AVKit

final class SearchViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var section: VideoSection?
    @Published var videos: [Video] = []
    @Published var isPlayerPresented = false

    var player = AVPlayer()

    @Injected
    private var videoService: VideoService

    func search() async {
        do {
            let result = try await videoService.search(query: searchText)
            await MainActor.run {
                section = result.catalog.sections.first
                videos = result.videos ?? []
            }
        } catch {
            print(error)
        }
    }

    func playVideo(_ video: Video) {
        let url = video.files.maxMp4 ?? video.files.hls
        player.replaceCurrentItem(with: AVPlayerItem(url: url))
        player.play()
    }

    func stopVideo() {
        player.pause()
        player.replaceCurrentItem(with: nil)
    }

    func loadMoreIfNeeded(for video: Video) async {
        guard
            let section,
            let next = section.nextFrom,
            let index = videos.firstIndex(where: { $0.id == video.id }),
            index == (videos.count - 1)
        else { return }

        do {
            let result = try await videoService.section(id: section.id, from: next)
            await MainActor.run {
                self.section = result.section
                for video in result.videos ?? [] where !self.videos.contains(where: { $0.id == video.id }) {
                    self.videos.append(video)
                }
            }
        } catch {
            print(error)
        }
    }
}
