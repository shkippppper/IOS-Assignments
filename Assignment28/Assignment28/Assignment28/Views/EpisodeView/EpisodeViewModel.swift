//
//  EpisodeViewModel.swift
//  Assignment28
//
//  Created by Akaki Titberidze on 31.05.24.
//

import Foundation
import NetworkingPackage

final class EpisodeViewModel: ObservableObject {
    // MARK: Variables
    
    @Published var allEpisodes: [Episode] = []
    private var nextPageUrl: String? = nil
    let mockUrl = "https://rickandmortyapi.com/api/episode"
    
    // MARK: Lifecycle
    
    init() {
        loadItems()
    }
    
    func loadItems() {
        fetchEpisodesData(url: mockUrl)
    }
    
    // MARK: Computed Properties
    
    func getEpisodesData() -> [Episode] {
        allEpisodes
    }
    
    func loadMoreEpisodes(currentItem: Episode?) {
        guard let currentItem = currentItem else {
            loadItems()
            return
        }

        let thresholdIndex = allEpisodes.index(allEpisodes.endIndex, offsetBy: -8)
        if allEpisodes.firstIndex(where: { $0.id == currentItem.id }) == thresholdIndex {
            if let nextPageUrl = nextPageUrl {
                fetchEpisodesData(url: nextPageUrl)
            }
        }
    }
    
    // MARK: Network Fetches
    
    func fetchEpisodesData(url: String) {
        guard let url = URL(string: url) else { return }
        //ამის გარეშე იქრაშება ინფინიტ სქროლი/ ჯიპიტიმ do catch მირჩია ვაღიარებ ჩემი დაწერილი არარი
        NetworkingPackage().fetchData(url: url) { data in
            do {
                let decodedResponse = try JSONDecoder().decode(Episodes.self, from: data)
                return decodedResponse
            } catch {
                print("Decoding error: \(error)")
                return nil
            }
        } completion: { result in
            switch result {
            case .success(let info):
                if let info = info {
                    self.allEpisodes.append(contentsOf: info.results)
                    self.nextPageUrl = info.info.next
                }
            case .failure(let error):
                print("\(error)")
            }
        }
    }

    
    func fetchEpisodeData(url: String, completion: @escaping (Episode?) -> Void) {
        guard let url = URL(string: url) else { return }

        NetworkingPackage().fetchData(url: url) { data in
            return try? JSONDecoder().decode(Episode.self, from: data)
        } completion: { result in
            switch result {
            case .success(let episode):
                completion(episode)
            case .failure(let error):
                completion(nil)
                print(error)
            }
        }
    }
        
    func fetchCharacterData(url: String, completion: @escaping (Character?) -> Void) {
        guard let url = URL(string: url) else { return }

        NetworkingPackage().fetchData(url: url) { data in
            return try? JSONDecoder().decode(Character.self, from: data)
        } completion: { result in
            switch result {
            case .success(let character):
                completion(character)
            case .failure(let error):
                completion(nil)
                print(error)
            }
        }
    }
}
