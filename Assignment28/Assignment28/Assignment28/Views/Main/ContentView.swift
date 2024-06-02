//
//  ContentView.swift
//  Assignment28
//
//  Created by Akaki Titberidze on 31.05.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            CharacterView(viewModel: CharacterViewModel())
                .tabItem {
                    Label("Characters", systemImage: "person")
                }
            EpisodeView(viewModel: EpisodeViewModel())
                .tabItem {
                    Label("Episodes", systemImage: "tv")
                }
            SearchView(viewModel: SearchViewModel())
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            LocationView(viewModel: LocationViewModel())
                .tabItem {
                    Label("Locations", systemImage: "mappin")
                }
        }
    }
}

#Preview {
    ContentView()
}
