//
//  RecipeDetailLoaderView.swift
//  Forkly
//
//  Created by Juan Rodriguez on 4/12/25.
//

import SwiftUI

struct RecipeDetailLoaderView: View {
    let recipeID: Int
    @State private var recipeDetail: RecipeDetail?
    @State private var isLoading = true
    @State private var errorMessage: String?

    var body: some View {
        Group {
            if isLoading {
                ProgressView("Loading recipe...")
            } else if let recipe = recipeDetail {
                RecipeDetailView(recipe: recipe)
            } else {
                Text(errorMessage ?? "Failed to load recipe.")
                    .foregroundColor(.red)
            }
        }
        .onAppear {
            fetchRecipeDetail()
        }
    }

    private func fetchRecipeDetail() {
        RecipeAPIService().getRecipeDetails(id: recipeID) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let detail):
                    self.recipeDetail = detail
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
                self.isLoading = false
            }
        }
    }
}
