//
//  ContentView.swift
//  VKVideo
//
//  Created by Svetoslav on 02.01.2024.
//

import SwiftUI
import AVKit

struct FeedView: View {
    @ObservedObject private var viewModel = FeedViewModel()

    private let columns = [
        GridItem(.fixed(Constants.columnWidth)),
        GridItem(.fixed(Constants.columnWidth)),
        GridItem(.fixed(Constants.columnWidth)),
        GridItem(.fixed(Constants.columnWidth)),
        GridItem(.fixed(Constants.columnWidth))
    ]

    private enum Constants {
        static let basePadding: CGFloat = 32
        static let shadowPadding: CGFloat = 80
        static let columnWidth: CGFloat = 320
    }

    var body: some View {
        ScrollView {
            Grid(verticalSpacing: 30) {
                ForEach(viewModel.catalog?.catalog.sections ?? []) { section in
                    GridRow {
                        VStack(alignment: .leading) {
                            Text(section.title)
                            if let fullSection = viewModel.sections.first(where: { $0.section.id == section.id }) {
                                ScrollView(.horizontal) {
                                    LazyHStack {
                                        ForEach(fullSection.videos ?? []) { video in
                                            VideoItem(
                                                video: video,
                                                fullSection: fullSection,
                                                onTap: {
                                                    viewModel.playVideo(video)
                                                    viewModel.isPlayerPresented.toggle()
                                                }
                                            ) { next in
                                                Task {
                                                    await viewModel.loadMore(id: section.id, from: next)
                                                }
                                            }
                                            .fullScreenCover(
                                                isPresented: $viewModel.isPlayerPresented,
                                                onDismiss: coverDidDismiss,
                                                content: {
                                                    VideoPlayer(player: viewModel.player)
                                                        .edgesIgnoringSafeArea(.all)
                                                }
                                            )
                                            .frame(width: 320, height: 240)
                                        }
                                    }
                                    .padding(Constants.shadowPadding)
                                }
                                .padding(-Constants.shadowPadding)
                            }
                        }
                    }
                }
            }
            .padding(Constants.basePadding)
        }
        .padding(-Constants.basePadding)
        .onAppear {
            Task {
                await viewModel.getCatalog()
            }
        }
    }

    private func coverDidDismiss() {
        viewModel.stopVideo()
    }
}

#Preview {
    FeedView()
}
