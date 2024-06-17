//
//  MoviesListView.swift
//  Assignment29
//
//  Created by Akaki Titberidze on 05.06.24.
//

import SwiftUI
import SwiftData

struct MoviesListView: View {
    @StateObject var viewModel: MoviesListViewModel
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @EnvironmentObject var contentViewModel: ContentViewModel
    @Environment(\.modelContext) private var context
    @Query private var favouriteItems: [MovieDetailedSwiftData]
    
    let compactColumns = [
        GridItem(.flexible(), spacing: 13),
        GridItem(.flexible(), spacing: 13),
        GridItem(.flexible())
    ]
    
    let regularColumns = [
        GridItem(.flexible(), spacing: 13),
        GridItem(.flexible(), spacing: 13),
        GridItem(.flexible(), spacing: 13),
        GridItem(.flexible(), spacing: 13),
        GridItem(.flexible(), spacing: 13),
        GridItem(.flexible())
    ]
    
    
    var body: some View {
        let columns: [GridItem] = horizontalSizeClass == .compact ? compactColumns : regularColumns
        
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 6) {
                    ForEach(viewModel.getMoviesData(), id: \.self) { movie in
                        movieCardView(for: movie)
                    }
                }
                .padding(16)
                .navigationTitle("Movies")
            }
            .background(Color.customBackground)
        }
    }
    
    
    private func movieCardView(for movie: Movie) -> some View {
        ZStack {
            NavigationLink(
                destination: MovieDetailedView(
                    movie: movie,
                    genres: viewModel.hasMovieDetail() ? viewModel.getFirstGenre() : "",
                    runtime: viewModel.hasMovieDetail() ? viewModel.getRuntime(): 0, 
                    isFavorite: viewModel.isFavourite(movie: movie, favouritesList: favouriteItems),
                    didClickFavourite: {
                        viewModel.saveToFavorites(context: context, movie: movie, favouritesList: favouriteItems)
                    }
                )
                .onAppear {
                    viewModel.detailedLoaded(id: movie.id ?? 1)
                }
            ) {
                CustomMovieCard(
                    imageUrl: "\(Constants.imageURL)\(movie.poster_path ?? "")",
                    title: movie.title ?? ""
                )
                .buttonStyle(PlainButtonStyle())
                .listRowBackground(Color.clear)
            }
        }
    }
}
