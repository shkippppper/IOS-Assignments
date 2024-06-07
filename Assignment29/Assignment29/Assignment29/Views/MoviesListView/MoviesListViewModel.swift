//
//  MoviesListViewModel.swift
//  Assignment29
//
//  Created by Akaki Titberidze on 05.06.24.
//

import Foundation
import NetworkingPackage

final class MoviesListViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    
    let moviesURL = ("\(Constants.popularMoviesURL)?api_key=\(Constants.apiKey)&page=1")
    
    init() {
        fetchMovies(url: moviesURL)
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
    
    func getMoviesData() -> [Movie] {
        movies
    }
}
