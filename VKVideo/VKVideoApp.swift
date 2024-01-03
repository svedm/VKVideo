//
//  VKVideoApp.swift
//  VKVideo
//
//  Created by Svetoslav on 02.01.2024.
//

import SwiftUI

@main
struct VKVideoApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }

    init() {
        let configurator = Configurator(container: Container.current)
        configurator.setup()
    }
}
