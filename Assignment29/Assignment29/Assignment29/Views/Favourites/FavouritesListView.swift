//
//  FavouritesListView.swift
//  Assignment29
//
//  Created by Akaki Titberidze on 09.06.24.
//

import SwiftUI
import SwiftData

struct FavouritesListView: View {
    @StateObject var viewModel: FavouritesViewModel
    @Query private var favouriteItems: [MovieDetailedSwiftData]
    @Environment(\.modelContext) private var context
    
    var body: some View {
            NavigationStack {
                ZStack {
                    Color.customBackground
                        .ignoresSafeArea()
                if favouriteItems.isEmpty {
                    VStack(spacing: 20) {
                        Text("No favourites yet")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundStyle(.customSecondary)
                            .frame(width: 190)
                        Text("All movies marked as favourite will be added here")
                            .font(.system(size: 12))
                            .foregroundStyle(.customGray)
                            .frame(width: 250)
                    }
                }else {
                    VStack {
                        Button("Clear All Favourites") {
                            viewModel.deleteAllFavourites(
                                context: context,
                                favouritesList: favouriteItems
                            )
                        }
                        .padding(8)
                        .background(.customSearchBackground)
                        .foregroundStyle(.customDefaultPrimary)
                        .clipShape(RoundedRectangle(cornerRadius: 16.0))
                        
                        // amis calke gatana sheidzleba vici mara dro arari ;ddd
                        ScrollView {
                            VStack {
                                ForEach(favouriteItems, id: \.id) {movie in
                                    ZStack {
                                        NavigationLink(
                                            destination: MovieDetailedView(
                                                movie: Movie(
                                                    backdrop_path: movie.backdrop_path,
                                                    id: movie.id,
                                                    overview: movie.overview,
                                                    poster_path: movie.poster_path,
                                                    release_date: movie.release_date,
                                                    title: movie.title,
                                                    vote_average: movie.vote_average
                                                ),
                                                genres: movie.genres,
                                                runtime: movie.runtime,
                                                isFavorite: viewModel.isFavourite(movie: movie, favouritesList: favouriteItems),
                                                didClickFavourite: {
                                                    viewModel.saveToFavorites(
                                                        context: context,
                                                        movie: movie,
                                                        favouritesList: favouriteItems
                                                    )
                                                }
                                            )
                                        ) {
                                            CustomSearchMovieCard(
                                                imageUrl: "\(Constants.imageURL)\(movie.poster_path)",
                                                title: movie.title,
                                                releaseDate: movie.release_date ,
                                                voteAverage: movie.vote_average,
                                                runTime: movie.runtime,
                                                genres: movie.genres
                                            )
                                            .buttonStyle(PlainButtonStyle())
                                            .listRowBackground(Color.clear)
                                        }
                                    }
                                }
                            }
                        }
                        .padding(16)
                    }

                }
            }
            .navigationTitle("Favourites")

        }
    }
}
