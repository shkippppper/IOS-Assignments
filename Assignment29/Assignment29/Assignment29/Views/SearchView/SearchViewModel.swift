//
//  SearchViewModel.swift
//  Assignment29
//
//  Created by Akaki Titberidze on 05.06.24.
//

import Foundation
import NetworkingPackage
import Combine

final class SearchViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var moviesDetailed: [MovieDetailed] = []
    @Published var currentSearchType: SearchTypes = .Name
    @Published var searchQuery: String = ""
    private var currentSearchQuery = ""
    private var isFetching = false
    private var cancellables = Set<AnyCancellable>()
    private var contentViewModel: ContentViewModel

    let searchURL = ("\(Constants.searchURL)&api_key=\(Constants.apiKey)")
    let discoverURL = ("\(Constants.discoverURL)&api_key=\(Constants.apiKey)")
    let detailedURL = Constants.detailedURL
    

    init(contentViewModel: ContentViewModel) {
        self.contentViewModel = contentViewModel
        $searchQuery
            .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] query in
                guard let self = self else { return }
                if !query.isEmpty {
                    self.searchMoviesData(query: query)
                }
            }
            .store(in: &cancellables)
    }
    
    func searchMoviesData(query: String) {
        currentSearchQuery = query
        moviesDetailed = []
        var urlString = ""
        switch currentSearchType {
        case .Name:
            urlString = "\(searchURL)&page=1&query=\(query)"
        case .Genre:
            if let genreId = contentViewModel.movieGenres.first(where: { $0.name.lowercased() == query.lowercased() })?.id {
                urlString = "\(discoverURL)&page=1&with_genres=\(genreId)"
            } else {
                urlString = "\(discoverURL)&page=1&with_genres=blank"
            }
        case .Year:
            urlString = "\(discoverURL)&page=1&primary_release_year=\(query)"
        }
        
        fetchMoviesData(url: urlString)
    }
    
    func detailedLoaded(id: Int) {
        fetchMovieDetailed(url: "\(detailedURL)\(id)?api_key=\(Constants.apiKey)")
    }
    
    private func fetchMoviesData(url: String) {
        isFetching = true
        NetworkingPackage().fetchData(url: URL(string: url)!) { data in
            return try! JSONDecoder().decode(Movies.self, from: data)
        } completion: { result in
            switch result {
            case .success(let info):
                if let info = info {
                    DispatchQueue.main.async{
                        self.movies = info.results
                    }
                    self.isFetching = false
                }
            case .failure(let error):
                self.isFetching = false
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
                        self.moviesDetailed.append(info)
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func searchTypeChanged(type: SearchTypes) {
        movies = []
        moviesDetailed = []
        currentSearchType = type
        searchMoviesData(query: currentSearchQuery)
    }
    
    func getMoviesData() -> [Movie] {
        movies
    }
    
    func getMovieDetailedGenres(index: Int) -> String {
        guard index < moviesDetailed.count else { return "" }
        let genres = moviesDetailed[index].genres.map { $0.name }
        return genres.joined(separator: ", ")
    }
    
    func getRuntime(index: Int) -> Int {
        guard index < moviesDetailed.count else { return 0 }
        return moviesDetailed[index].runtime
    }
    
    func notFetched() -> Bool {
        !isFetching && currentSearchQuery == ""
    }
    
    func noResults() -> Bool {
        movies.isEmpty && currentSearchQuery != "" && !isFetching
    }
    
}
