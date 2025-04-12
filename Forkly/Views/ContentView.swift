//
//  ContentView.swift
//  Forkly
//
//  Created by Juan Rodriguez on 4/12/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var favoritesManager: FavoritesManager
    @State private var isLoading = true

    var body: some View {
        ZStack {
            if isLoading {
                LoadingView()
            } else {
                TabView {
                    FeaturedRecipesView()
                        .tabItem {
                            Label("Featured", systemImage: "star.fill")
                        }

                    FavoritesView()
                        .environmentObject(favoritesManager)
                        .tabItem {
                            Label("Favorites", systemImage: "heart.fill")
                        }

                    SearchView()
                        .tabItem {
                            Label("Search", systemImage: "magnifyingglass")
                        }
                }
                .accentColor(.orange)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                isLoading = false
            }
        }
    }
}


#Preview {
    ContentView()
        .environmentObject(FavoritesManager())
}
