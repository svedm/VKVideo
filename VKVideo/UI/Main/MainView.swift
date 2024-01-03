//
//  MainView.swift
//  VKVideo
//
//  Created by Svetoslav on 03.01.2024.
//

import SwiftUI

struct MainView: View {
    @State private var item: Item = .feed

    private enum Item {
        case feed
        case search
    }

    var body: some View {
        NavigationStack {
            TabView(selection: $item) {
                FeedView().tabItem { Text("Каталог") }
                SearchView().tabItem { Text("Поиск") }
            }
        }
    }
}
