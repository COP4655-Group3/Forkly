//
//  FavoritesManager.swift
//  Forkly
//
//  Created by Juan Rodriguez on 4/12/25.
//

import Foundation

class FavoritesManager: ObservableObject {
    @Published var favorites: [Recipe] = []

    private let key = "favoriteRecipes"

    init() {
        loadFavorites()
    }

    // MARK: - Toggle Favorite
    func toggleFavorite(_ recipe: Recipe) {
        if let index = favorites.firstIndex(where: { $0.id == recipe.id }) {
            favorites.remove(at: index)
        } else {
            favorites.append(recipe)
        }
        saveFavorites()
    }

    // MARK: - Check Favorite Status
    func isFavorite(_ recipe: Recipe) -> Bool {
        favorites.contains { $0.id == recipe.id }
    }

    // MARK: - Save to UserDefaults
    private func saveFavorites() {
        if let encoded = try? JSONEncoder().encode(favorites) {
            UserDefaults.standard.set(encoded, forKey: key)
        }
    }

    // MARK: - Load from UserDefaults
    private func loadFavorites() {
        if let data = UserDefaults.standard.data(forKey: key),
           let decoded = try? JSONDecoder().decode([Recipe].self, from: data) {
            favorites = decoded
        }
    }
}

