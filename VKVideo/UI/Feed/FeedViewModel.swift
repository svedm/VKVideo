//
//  FeedViewModel.swift
//  VKVideo
//
//  Created by Svetoslav on 03.01.2024.
//

import Foundation
import AVKit

final class FeedViewModel: ObservableObject {
    @Published var catalog: VideoStandalone?
    @Published var sections: [VideoSectionInfo] = []
    @Published var isPlayerPresented = false
    var player = AVPlayer()

    @Injected
    var videoService: VideoService

    func getCatalog() async {
        do {
            let catalog = try await videoService.catalogVideoStandalone()
            await MainActor.run {
                self.catalog = catalog
            }
            await getSections(catalog: catalog)
        } catch {
            print(error)
        }
    }

    private func getSections(catalog: VideoStandalone) async {
        for catalogSection in catalog.catalog.sections {
            do {
                let section = try await videoService.section(id: catalogSection.id)
                await MainActor.run {
                    self.sections.removeAll(where: { $0.section.id == catalogSection.id })
                    self.sections.append(section)
                }
                try await Task.sleep(nanoseconds: 1_000_000_000 / 2) // 0.5 sec
            } catch {
                print(error)
            }
        }
    }

    func loadMore(id: String, from: String) async {
        do {
            let newSectionData = try await videoService.section(id: id, from: from)
            await MainActor.run {
                if let sectionId = self.sections.firstIndex(where: { $0.section.id == id }),
                    let videos = newSectionData.videos {
                    let existVideos = sections[sectionId].videos ?? []

                    for video in videos where !existVideos.contains(where: { $0.id == video.id }) {
                        sections[sectionId].videos?.append(video)
                        sections[sectionId].section.nextFrom = newSectionData.section.nextFrom
                    }
                }
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
}
