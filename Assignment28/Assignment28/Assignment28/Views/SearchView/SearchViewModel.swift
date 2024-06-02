//  SearchViewModel.swift
//  Assignment28
//
//  Created by Akaki Titberidze on 31.05.24.
//
import Foundation
import NetworkingPackage
import Combine

final class SearchViewModel: ObservableObject {
    
    // MARK: Variables
    private let baseUrl = "https://rickandmortyapi.com/api/"
    @Published var allCharacters: [Character] = []
    @Published var allEpisodes: [Episode] = []
    @Published var allLocations: [Location] = []
    @Published var searchText = ""
    @Published var selectedCategory: Int = 0 {
        didSet {
            searchText = ""
            allCharacters = []
            allEpisodes = []
            allLocations = []
        }
    }
    
    // MARK: Functions
    
    func fetchCharactersData(query: String) {
        let categoryPath: String
        switch selectedCategory {
        case 1:
            categoryPath = "episode/?name="
        case 2:
            categoryPath = "location/?name="
        default:
            categoryPath = "character/?name="
        }
        
        guard let url = URL(string: "\(baseUrl)\(categoryPath)\(query)") else {
            print("Invalid URL")
            return
        }
        
        switch selectedCategory {
        case 1:
            getAllEpisodes(url: url)
        case 2:
            getAllLocations(url: url)
        default:
            getAllCharacters(url: url)
        }
    }
    
    // MARK: Networking
    
    private func getAllCharacters(url: URL) {
        NetworkingPackage().fetchData(url: url) { data in
            return try? JSONDecoder().decode(Characters.self, from: data)
        } completion: { result in
            switch result {
            case .success(let info):
                if let info = info {
                    DispatchQueue.main.async {
                        self.allCharacters = info.results
                    }
                }
            case .failure(let error):
                print("Failed to fetch characters: \(error)")
            }
        }
    }
    
    private func getAllEpisodes(url: URL) {
        NetworkingPackage().fetchData(url: url) { data in
            return try? JSONDecoder().decode(Episodes.self, from: data)
        } completion: { result in
            switch result {
            case .success(let info):
                if let info = info {
                    DispatchQueue.main.async {
                        self.allEpisodes = info.results
                    }
                }
            case .failure(let error):
                print("Failed to fetch episodes: \(error)")
            }
        }
    }
    
    private func getAllLocations(url: URL) {
        NetworkingPackage().fetchData(url: url) { data in
            return try? JSONDecoder().decode(Locations.self, from: data)
        } completion: { result in
            switch result {
            case .success(let info):
                if let info = info {
                    DispatchQueue.main.async {
                        self.allLocations = info.results
                    }
                }
            case .failure(let error):
                print("Failed to fetch locations: \(error)")
            }
        }
    }
    
    // MARK: Computed Properties
    
    func getCharactersData() -> [Character] {
        allCharacters
    }
    
    func getEpisodesData() -> [Episode] {
        allEpisodes
    }

    func getLocationsData() -> [Location] {
        allLocations
    }
}
