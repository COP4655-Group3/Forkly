//
//  Recipe.swift
//  Forkly
//
//  Created by Juan Rodriguez on 4/12/25.
//

import Foundation

struct Recipe: Identifiable, Codable, Hashable {
    let id: Int
    let title: String
    let image: String?

    // ✅ Add this property to avoid your current error
    var isLocalImage: Bool {
        if let image = image {
            return !image.contains("http")
        }
        return false
    }
}
