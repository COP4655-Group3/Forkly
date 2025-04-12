//
//  SearchView.swift
//  Forkly
//
//  Created by Juan Rodriguez on 4/12/25.
//

import SwiftUI

struct SearchView: View {
    @StateObject private var viewModel = RecipeSearchViewModel()
    @EnvironmentObject var favoritesManager: FavoritesManager
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                HStack {
                    Text("Find a Recipe")
                        .font(.custom("Pacifico-Regular", size: 28))
                        .foregroundColor(.orange)
                    
//                        .foregroundColor(Color(red: 0.0, green: 112/255, blue: 74/255))
//                        .shadow(color: Color.black.opacity(0.25), radius: 2, x: 1, y: 1)
                    
//                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top)
                
                // Search bar
                TextField("Search for recipes...", text: $viewModel.query)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .onSubmit {
                        viewModel.search()
                    }

                // Loading state
                if viewModel.isLoading {
                    ProgressView("Searching...")
                        .padding()
                }

                // Error message
                if let error = viewModel.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                        .padding()
                }

                // Results
                ScrollView {
                    LazyVStack(spacing: 16) {
                        ForEach(viewModel.results, id: \.id) { recipe in
                            NavigationLink(value: recipe.id) {
                                RecipeCardView(recipe: Recipe(
                                    id: recipe.id,
                                    title: recipe.title,
                                    image: recipe.image
                                ))
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
//            .navigationTitle("Search")
//            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: Int.self) { recipeID in
                // ✅ Using explicit return type here prevents "Generic parameter 'V'" error
                AnyView(RecipeDetailLoaderView(recipeID: recipeID))
            }
        }
    }
}

#Preview {
    SearchView()
        .environmentObject(FavoritesManager()) // ✅ required for preview
}
