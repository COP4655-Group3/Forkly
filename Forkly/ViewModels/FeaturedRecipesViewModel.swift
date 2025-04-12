//
//  FeaturedRecipesViewModel.swift
//  Forkly
//
//  Created by Juan Rodriguez on 4/12/25.
//

import Foundation

class FeaturedRecipesViewModel: ObservableObject {
    @Published var featuredRecipes: [Recipe] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    func loadFeaturedRecipes() {
        isLoading = true
        errorMessage = nil

        RecipeAPIService().fetchFeaturedRecipes { [weak self] recipes in
            DispatchQueue.main.async {
                self?.isLoading = false
                if let recipes = recipes {
                    self?.featuredRecipes = recipes
                } else {
                    self?.errorMessage = "Failed to load featured recipes."
                }
            }
        }
    }
}
