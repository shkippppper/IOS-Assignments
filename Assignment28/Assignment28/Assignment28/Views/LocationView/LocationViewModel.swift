//
//  LocationViewModel.swift
//  Assignment28
//
//  Created by Akaki Titberidze on 31.05.24.
//

import Foundation
import NetworkingPackage

final class LocationViewModel: ObservableObject {
    // MARK: Variables
    @Published var allLocations: [Location] = []
    private var nextPageUrl: String? = nil
    let mockUrl = "https://rickandmortyapi.com/api/location"
    
    // MARK: Lifecycle
    
    init() {
        loadItems()
    }
    
    func loadItems() {
        fetchLocationsData(url: mockUrl)
    } 
    
    // MARK: Computed Properties
    
    func getLocationsData() -> [Location] {
        allLocations
    }
    
    func loadMoreLocations(currentItem: Location?) {
        guard let currentItem = currentItem else {
            loadItems()
            return
        }

        let thresholdIndex = allLocations.index(allLocations.endIndex, offsetBy: -8)
        if allLocations.firstIndex(where: { $0.id == currentItem.id }) == thresholdIndex {
            if let nextPageUrl = nextPageUrl {
                fetchLocationsData(url: nextPageUrl)
            }
        }
    }
    
    // MARK: Network Fetches
    
    func fetchLocationsData(url: String) {
        guard let url = URL(string: url) else { return }
        //ამის გარეშე იქრაშება ინფინიტ სქროლი/ ჯიპიტიმ do catch მირჩია ვაღიარებ ჩემი დაწერილი არარი
        NetworkingPackage().fetchData(url: url) { data in
            do {
                let decodedResponse = try JSONDecoder().decode(Locations.self, from: data)
                return decodedResponse
            } catch {
                print("Decoding error: \(error)")
                return nil
            }
        } completion: { result in
            switch result {
            case .success(let info):
                if let info = info {
                    self.allLocations.append(contentsOf: info.results)
                    self.nextPageUrl = info.info.next
                }
            case .failure(let error):
                print("\(error)")
            }
        }
    }

    
    func fetchLocationData(url: String, completion: @escaping (Location?) -> Void) {
        guard let url = URL(string: url) else { return }

        NetworkingPackage().fetchData(url: url) { data in
            return try? JSONDecoder().decode(Location.self, from: data)
        } completion: { result in
            switch result {
            case .success(let location):
                completion(location)
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
