//
//  ContentView.swift
//  Assignment29
//
//  Created by Akaki Titberidze on 05.06.24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var contentViewModel = ContentViewModel()
    
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(named: "customBackground")
        
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = UIColor(named: "customBackground")
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor(named: "customSecondary") ?? .white]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor(named: "customSecondary") ?? .white]
        
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        UINavigationBar.appearance().compactAppearance = navBarAppearance
    }
    
    var body: some View {
        ZStack {
            Color.customBackground
                .ignoresSafeArea()
            TabView {
                MoviesListView(viewModel: MoviesListViewModel())
                    .background(Color.customBackground.ignoresSafeArea())
                    .tabItem {
                        Label("Movies", systemImage: "film.stack")
                    }
                    .environmentObject(contentViewModel)
                
                SearchView(viewModel: SearchViewModel())
                    .background(Color.customBackground.ignoresSafeArea())
                    .tabItem {
                        Label("Search", systemImage: "magnifyingglass")
                    }
                    .environmentObject(contentViewModel)
                
            }
            .accentColor(.customSecondary)
        }
    }
}

#Preview {
    ContentView()
}
