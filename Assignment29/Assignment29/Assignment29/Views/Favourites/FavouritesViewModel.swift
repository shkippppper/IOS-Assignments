//
//  FavouritesViewModel.swift
//  Assignment29
//
//  Created by Akaki Titberidze on 09.06.24.
//

import Foundation
import SwiftData

final class FavouritesViewModel: ObservableObject {
    
    func saveToFavorites(context: ModelContext, movie: MovieDetailedSwiftData, favouritesList: [MovieDetailedSwiftData]) {
        
        for favMovie in favouritesList {
            if favMovie.id == movie.id {
                context.delete(movie)
            }
            return
        }
        
        let item = MovieDetailedSwiftData(
            backdrop_path: movie.backdrop_path,
            id: movie.id,
            overview: movie.overview,
            poster_path: movie.poster_path,
            release_date: movie.release_date,
            title: movie.title,
            vote_average: movie.vote_average,
            genres: movie.genres,
            runtime: movie.runtime
        )
        context.insert(item)
    }
    
    
    func deleteAllFavourites(context: ModelContext, favouritesList: [MovieDetailedSwiftData]) {
        for item in favouritesList {
            context.delete(item)
        }
    }
    
    func isFavourite(movie: MovieDetailedSwiftData, favouritesList: [MovieDetailedSwiftData]) -> Bool {
        favouritesList.contains(where: { $0.id == movie.id })
    }
}
