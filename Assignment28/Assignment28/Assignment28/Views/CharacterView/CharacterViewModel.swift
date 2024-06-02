//
//  CharacterViewModel.swift
//  Assignment28
//
//  Created by Akaki Titberidze on 31.05.24.
//

import Foundation
import NetworkingPackage

final class CharacterViewModel: ObservableObject {
    // MARK: Variables
    
    @Published var allCharacters: [Character] = []
    private var nextPageUrl: String = ""
    let mockUrl = "https://rickandmortyapi.com/api/character"
    
    // MARK: Lifecycle
    
    init() {
        loadItems()
    }
    
    func loadItems() {
        fetchCharactersData(url: mockUrl)
    }
    
    // MARK: Computed Properties
    
    func getCharactersData() -> [Character] {
        allCharacters
    }
    
    func loadMoreCharacters(currentItem: Character?) {
        guard let currentItem = currentItem else {
            loadItems()
            return
        }

        let thresholdIndex = allCharacters.index(allCharacters.endIndex, offsetBy: -2)
        if allCharacters.firstIndex(where: { $0.id == currentItem.id }) == thresholdIndex {
            fetchCharactersData(url: nextPageUrl)
        }
    }
    
    // MARK: Network Fetches
    
    func fetchCharactersData(url: String){
        NetworkingPackage().fetchData(url: URL(string: url)!) { data in
            return try! JSONDecoder().decode(Characters.self, from: data)
        } completion: { result in
            switch result {
            case .success(let info):
                if let info = info {
                    self.allCharacters.append(contentsOf: info.results)
                    self.nextPageUrl = info.info.next ?? ""
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchEpisodeData(url: String, completion: @escaping (Episode?) -> Void){
        NetworkingPackage().fetchData(url: URL(string: url)!) { data in
            return try! JSONDecoder().decode(Episode.self, from: data)
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
        
    func fetchCharacterData(url: String, completion: @escaping (Character?) -> Void){
        NetworkingPackage().fetchData(url: URL(string: url)!) { data in
            return try! JSONDecoder().decode(Character.self, from: data)
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
