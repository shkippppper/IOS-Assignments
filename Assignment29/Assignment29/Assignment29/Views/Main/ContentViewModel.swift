//
//  ContentViewModel.swift
//  Assignment29
//
//  Created by Akaki Titberidze on 05.06.24.
//

import SwiftUI
import NetworkingPackage

final class ContentViewModel: ObservableObject {
    @Published var movieGenres: [Genre] = []
    let genresURL = ("\(Constants.genresURL)?api_key=\(Constants.apiKey)")
    
    init() {
        fetchMovieGenres(url: genresURL)
    }
    
    private func fetchMovieGenres(url: String) {
        NetworkingPackage().fetchData(url: URL(string: url)!) { data in
            return try! JSONDecoder().decode(Genres.self, from: data)
        } completion: { result in
            switch result {
            case .success(let info):
                if let info = info {
                    DispatchQueue.main.async{
                        self.movieGenres = info.genres
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func mapGenreIdsToNames(genreIds: [Int]) -> [String] {
        return genreIds.compactMap { id in
            movieGenres.first { $0.id == id }?.name
        }
    }
}
