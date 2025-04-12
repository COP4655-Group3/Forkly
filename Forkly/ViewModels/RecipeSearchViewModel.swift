//
//  RecipeSearchViewModel.swift
//  Forkly
//
//  Created by Juan Rodriguez on 4/12/25.
//

import Foundation

class RecipeSearchViewModel: ObservableObject {
    @Published var query: String = ""
    @Published var results: [Recipe] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    private let apiService = RecipeAPIService()

    // MARK: - Search Trigger
    func search() {
        let trimmedQuery = query.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedQuery.isEmpty else {
            results = []
            return
        }

        isLoading = true
        errorMessage = nil

        apiService.searchRecipes(query: trimmedQuery) { [weak self] recipes in
            DispatchQueue.main.async {
                self?.isLoading = false

                if let recipes = recipes {
                    self?.results = recipes
                } else {
                    self?.results = []
                    self?.errorMessage = "Unable to fetch results. Try again."
                }
            }
        }
    }
}
