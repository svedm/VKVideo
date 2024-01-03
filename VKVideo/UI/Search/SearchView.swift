//
//  SearchView.swift
//  VKVideo
//
//  Created by Svetoslav on 03.01.2024.
//

import SwiftUI
import AVKit

struct SearchView: View {
    @ObservedObject private var viewModel = SearchViewModel()

    var body: some View {
        VStack(alignment: .leading) {
            TextField("Поиск", text: $viewModel.searchText)
                .onChange(of: viewModel.searchText) { _ in
                    Task {
                        await viewModel.search()
                    }
                }
            List(viewModel.videos) { video in
                Button(
                    action: {
                        viewModel.playVideo(video)
                        viewModel.isPlayerPresented.toggle()
                    }
                ) {
                    HStack(alignment: .top) {
                        AsyncImage(url: video.previewURL) { image in
                            image.image?.resizable()
                                .scaledToFit()
                        }
                        .frame(width: 480)
                        VStack(alignment: .leading, spacing: 12) {
                            Text(video.title)
                                .font(.title2)
                                .bold()
                            Text(video.description)
                                .font(.caption)
                        }
                    }
                }
                .onAppear {
                    Task { await viewModel.loadMoreIfNeeded(for: video) }
                }
                .fullScreenCover(
                    isPresented: $viewModel.isPlayerPresented,
                    onDismiss: coverDidDismiss,
                    content: {
                        VideoPlayer(player: viewModel.player)
                            .edgesIgnoringSafeArea(.all)
                    }
                )
                .frame(height: 320)
            }
        }
    }

    private func coverDidDismiss() {
        viewModel.stopVideo()
    }
}

#Preview {
    SearchView()
}
