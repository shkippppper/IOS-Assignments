//
//  MoviesListView.swift
//  Assignment29
//
//  Created by Akaki Titberidze on 05.06.24.
//

import SwiftUI

struct MoviesListView: View {
    @StateObject var viewModel: MoviesListViewModel
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @EnvironmentObject var contentViewModel: ContentViewModel
    
    var body: some View {
        let columns = horizontalSizeClass == .compact
        ? [GridItem(.flexible(), spacing: 16), GridItem(.flexible())]
        : [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16), GridItem(.flexible())]
        
        ScrollView {
            LazyVGrid( columns: columns,
                       spacing: 20,
                       content: {
                ForEach(viewModel.getMoviesData(), id: \.self) { movie in
                    ZStack {
                        
                        CustomMovieCard(
                            imageUrl: "\(Constants.imageURL)\(movie.poster_path ?? "")",
                            title: movie.title ?? "",
                            releaseDate: movie.release_date ?? "",
                            voteAverage: movie.vote_average ?? 0,
                            voteCount: movie.vote_count ?? 0,
                            genres: contentViewModel.mapGenreIdsToNames(genreIds: movie.genre_ids ?? [])
                        )
                        .buttonStyle(PlainButtonStyle())
                        .listRowBackground(Color.clear)
                    }
                }
            })
            .padding(16)
            .navigationTitle("Episodes")
        }
        .background(Color.customBackground)
    }
}
