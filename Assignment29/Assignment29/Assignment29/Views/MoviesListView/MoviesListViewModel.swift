//
//  MoviesListViewModel.swift
//  Assignment29
//
//  Created by Akaki Titberidze on 05.06.24.
//

import Foundation
import NetworkingPackage
import SwiftData

final class MoviesListViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var movieDetailed: MovieDetailed?
    
    let moviesURL = ("\(Constants.popularMoviesURL)?api_key=\(Constants.apiKey)&page=1")
    let detailedURL = Constants.detailedURL
    
    init() {
        fetchMovies(url: moviesURL)
    }
    
    
    func detailedLoaded(id: Int) {
        fetchMovieDetailed(url: "\(detailedURL)\(id)?api_key=\(Constants.apiKey)")
    }
    
    private func fetchMovies(url: String) {
        NetworkingPackage().fetchData(url: URL(string: url)!) { data in
            return try! JSONDecoder().decode(Movies.self, from: data)
        } completion: { result in
            switch result {
            case .success(let info):
                if let info = info {
                    DispatchQueue.main.async{
                        self.movies = info.results
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func fetchMovieDetailed(url: String) {
        NetworkingPackage().fetchData(url: URL(string: url)!) { data in
            return try! JSONDecoder().decode(MovieDetailed.self, from: data)
        } completion: { result in
            switch result {
            case .success(let info):
                if let info = info {
                    DispatchQueue.main.async{
                        self.movieDetailed = info
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func saveToFavorites(context: ModelContext, movie: Movie, favouritesList: [MovieDetailedSwiftData]) {
        if let existingFav = favouritesList.first(where: { $0.id == movie.id }) {
            context.delete(existingFav)
            return
        }
        
        let item = MovieDetailedSwiftData(
            backdrop_path: movie.backdrop_path ?? "",
            id: movie.id ?? 1,
            overview: movie.overview ?? "",
            poster_path: movie.poster_path ?? "",
            release_date: movie.release_date ?? "",
            title: movie.title ?? "",
            vote_average: movie.vote_average ?? 0,
            genres: getFirstGenre(),
            runtime: getRuntime()
        )
        context.insert(item)
    }
    
    func getMoviesData() -> [Movie] {
        movies
    }
    
    func getRating(rating: Double) -> Double {
        Double(Int(rating * 10)) / 10
    }
    
    func hasMovieDetail() -> Bool {
        movieDetailed?.runtime != nil && movieDetailed?.genres != nil
    }
    
    func getRuntime() -> Int {
        movieDetailed?.runtime ?? 0
    }
    
    func getFirstGenre() -> String {
        movieDetailed?.genres.first?.name ?? "No Genre"
    }
    
    func isFavourite(movie: Movie, favouritesList: [MovieDetailedSwiftData]) -> Bool {
        favouritesList.contains(where: { $0.id == movie.id })
    }
    
}
