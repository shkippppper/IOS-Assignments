//
//  ContentView.swift
//  Assignment29
//
//  Created by Akaki Titberidze on 05.06.24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var contentViewModel = ContentViewModel()
    
    var body: some View {
        ZStack {
            Color.customBackground
                .ignoresSafeArea()
            TabView {
                MoviesListView(viewModel: MoviesListViewModel())
                    .background(Color.customBackground.ignoresSafeArea())
                    .tabItem {
                        Image("iconTabbarHome1x")
                            .renderingMode(.template)
                        Text("Home")
                    }
                
                SearchView(viewModel: SearchViewModel(contentViewModel: contentViewModel))
                    .background(Color.customBackground.ignoresSafeArea())
                    .tabItem {
                        Image("iconTabbarSearch1x")
                            .renderingMode(.template)
                        Text("Search")
                    }

                FavouritesListView(viewModel: FavouritesViewModel())
                    .background(Color.customBackground.ignoresSafeArea())
                    .tabItem {
                        Image("iconFavourites1x")
                            .renderingMode(.template)
                        Text("Favourites")
                    }
                
            }
            .environmentObject(contentViewModel)
            
        }
    }
}

#Preview {
    ContentView()
}
