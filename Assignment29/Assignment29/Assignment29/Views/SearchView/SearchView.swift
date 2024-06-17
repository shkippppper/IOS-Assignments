//
//  SearchView.swift
//  Assignment29
//
//  Created by Akaki Titberidze on 05.06.24.
//

import SwiftUI
import SwiftUI

struct SearchView: View {
    @StateObject var viewModel: SearchViewModel
    @State private var searchText = ""
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @EnvironmentObject var contentViewModel: ContentViewModel
    
    let compactColumns = [
        GridItem(.flexible(), spacing: 16)
    ]
    
    let regularColumns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible())
    ]
    
    var body: some View {
        
        NavigationStack {
            VStack(spacing: 0) {
                CustomSearchBarView(
                    searchText: $viewModel.searchQuery,
                    selectedSearchType: $viewModel.currentSearchType,
                    placeholderText: "try Spiderman :)",
                    onSearch: {viewModel.searchMoviesData(query: searchText)},
                    onTypeChange: {searchType in
                        viewModel.searchTypeChanged(type: searchType)
                    }
                )
                .background(Color.customBackground)
                
                ScrollView {
                    if viewModel.notFetched() {
                        notFetched
                    } else if viewModel.noResults() {
                        noResults
                    } else {
                        searchResults(viewModel: viewModel)
                    }
                }
                .frame(maxWidth: .infinity)
                .background(Color.customBackground)
                .navigationTitle("Search")
            }
        }
    }
    
    var notFetched: some View {
        VStack(spacing: 20) {
            Text("Use the magic search!")
                .font(.system(size: 16, weight: .bold))
                .foregroundStyle(.customSecondary)
                .frame(width: 190)
            Text("I will do my best to search everything relevant, I promise!")
                .font(.system(size: 12))
                .foregroundStyle(.customGray)
                .frame(width: 250)
        }
        .padding(.top, 200)
    }
    
    var noResults: some View {
        VStack(spacing: 20) {
            Text("Oh no isn’t this so embarrassing?")
                .font(.system(size: 16, weight: .bold))
                .foregroundStyle(.customSecondary)
                .frame(width: 190)
            Text("I cannot find any movie with this name.")
                .font(.system(size: 12))
                .foregroundStyle(.customGray)
                .frame(width: 250)
        }
        .padding(.top, 200)
    }
    
    func searchResults(viewModel: SearchViewModel) -> some View {
        let columns: [GridItem] = horizontalSizeClass == .compact ? compactColumns : regularColumns
        let moviesWithIndex = Array(viewModel.getMoviesData().enumerated())

        return LazyVGrid(columns: columns, spacing: 20) {
            ForEach(moviesWithIndex, id: \.element) { index, movie in
                ZStack {
                    CustomSearchMovieCard(
                        imageUrl: "\(Constants.imageURL)\(movie.poster_path ?? "")",
                        title: movie.title ?? "",
                        releaseDate: movie.release_date ?? "",
                        voteAverage: movie.vote_average ?? 0,
                        runTime: viewModel.getRuntime(index: index),
                        genres: viewModel.getMovieDetailedGenres(index: index)
                    )
                    .buttonStyle(PlainButtonStyle())
                    .listRowBackground(Color.clear)
                    .onAppear {
                        viewModel.detailedLoaded(id: movie.id ?? 1)
                    }
                }
            }
        }
        .padding(16)
    }
}
