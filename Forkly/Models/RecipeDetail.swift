//
//  RecipeDetail.swift
//  Forkly
//
//  Created by Juan Rodriguez on 4/12/25.
//

import Foundation

struct RecipeDetail: Identifiable, Codable, Hashable {
    let id: Int
    let title: String
    let summary: String?
    let image: String?
    let instructions: String?
}
