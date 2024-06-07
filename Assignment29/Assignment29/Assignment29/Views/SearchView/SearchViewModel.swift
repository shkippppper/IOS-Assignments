//
//  SearchViewModel.swift
//  Assignment29
//
//  Created by Akaki Titberidze on 05.06.24.
//

import Foundation
import NetworkingPackage

final class SearchViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    
    let searchURL = ("\(Constants.searchURL)&api_key=\(Constants.apiKey)")
    
    func searchMoviesData(query: String) {
        fetchMoviesData(url: "\(searchURL)&page=1&query=\(query)")
    }
    
    private func fetchMoviesData(url: String) {
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
