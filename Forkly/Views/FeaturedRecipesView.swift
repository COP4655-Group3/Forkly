//
//  FeaturedRecipesView.swift
//  Forkly
//
//  Created by Juan Rodriguez on 4/12/25.
//

import SwiftUI

struct FeaturedRecipesView: View {
    @StateObject private var viewModel = FeaturedRecipesViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("Featured Recipes")
                        .font(.custom("Pacifico-Regular", size: 28))
                        .foregroundColor(.orange)
//                        .foregroundColor(Color(red: 0.0, green: 112/255, blue: 74/255))
//                        .shadow(color: Color.black.opacity(0.25), radius: 2, x: 1, y: 1)
                    
//                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top)

                Divider()

                if viewModel.isLoading {
                    ProgressView("Loading Recipes...")
                        .padding()
                } else if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                } else {
                    ScrollView {
                        LazyVStack(spacing: 20) {
                            ForEach(viewModel.featuredRecipes) { recipe in
                                NavigationLink(value: recipe.id) {
                                    RecipeCardView(recipe: recipe)
                                }
                            }
                        }
                        .padding()
                    }
                    .refreshable {
                        viewModel.loadFeaturedRecipes()
                    }
                }
            }
            .onAppear {
                viewModel.loadFeaturedRecipes()
            }
            .navigationDestination(for: Int.self) { recipeID in
                RecipeDetailLoaderView(recipeID: recipeID)
            }
        }
    }
}

#Preview {
    FeaturedRecipesView()
}
