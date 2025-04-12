//
//  ForklyApp.swift
//  Forkly
//
//  Created by Juan Rodriguez on 4/12/25.
//

import SwiftUI

@main
struct ForklyApp: App {
    @StateObject var favoritesManager = FavoritesManager()
    
    init() {
        // Set selected tab color
        UITabBar.appearance().tintColor = UIColor.orange
        
        // Optional: change background and unselected colors too
        // UITabBar.appearance().barTintColor = UIColor.white
        // UITabBar.appearance().unselectedItemTintColor = UIColor.gray
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(favoritesManager)
        }
    }
}
