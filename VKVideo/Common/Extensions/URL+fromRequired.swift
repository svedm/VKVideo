//
//  URL+fromRequired.swift
//  VKVideo
//
//  Created by Svetoslav on 02.01.2024.
//

import Foundation

extension URL {
    static func fromRequired(string: String) -> URL {
        // swiftlint:disable:next force_unwrapping
        URL(string: string)!
    }
}
