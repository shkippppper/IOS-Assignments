//  SearchView.swift
//  Assignment28
//
//  Created by Akaki Titberidze on 31.05.24.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel: SearchViewModel
    @State private var searchText = ""
    
    var body: some View {
        VStack {
            CustomSearchBarView(searchText: $searchText) {
                viewModel.fetchCharactersData(query: searchText)
            }
            Picker("Select Category", selection: $viewModel.selectedCategory) {
                Text("Characters").tag(0)
                Text("Episodes").tag(1)
                Text("Locations").tag(2)
            }
            .pickerStyle(.segmented)
            .padding(.horizontal, 16)
            
            Spacer()
            ScrollView {
                if viewModel.selectedCategory == 0 {
                    SearchCharacterResultsView(viewModel: viewModel)
                } else if viewModel.selectedCategory == 1 {
                    SearchEpisodeResultsView(viewModel: viewModel)
                } else if viewModel.selectedCategory == 2 {
                    SearchLocationResultsView(viewModel: viewModel)
                }
            }
            .navigationTitle("Search")
        }
    }
}

// MARK: Custom Components

struct SearchCharacterResultsView: View {
    var viewModel: SearchViewModel
    let columns = [GridItem(.flexible(), spacing: 16), GridItem(.flexible())]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(viewModel.allCharacters, id: \.hashValue) { character in
                CustomCharacterCell(
                    imageUrl: character.image,
                    name: character.name,
                    status: character.status,
                    species: character.species
                )
                .buttonStyle(PlainButtonStyle())
                .listRowBackground(Color.clear)
            }
        }
        .padding(16)
    }
}

struct SearchEpisodeResultsView: View {
    var viewModel: SearchViewModel
    let columns = [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16), GridItem(.flexible())]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(viewModel.allEpisodes, id: \.hashValue) { episode in
                CustomEpisodeCell(name: episode.episode)
                    .buttonStyle(PlainButtonStyle())
                    .listRowBackground(Color.clear)
            }
        }
        .padding(16)
    }
}

struct SearchLocationResultsView: View {
    var viewModel: SearchViewModel
    let columns = [GridItem(.flexible())]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(viewModel.allLocations, id: \.hashValue) { location in
                CustomLocationCell(name: location.name, type: location.type)
                    .buttonStyle(PlainButtonStyle())
                    .listRowBackground(Color.clear)
            }
        }
        .padding(16)
    }
}
