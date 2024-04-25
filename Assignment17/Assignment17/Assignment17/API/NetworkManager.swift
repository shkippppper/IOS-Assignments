//
//  NetworkManager.swift
//  Assignment17
//
//  Created by Akaki Titberidze on 25.04.24.
//

import Foundation
import UIKit

class NetworkManager {
    static let shared = NetworkManager()

    private init() {}

    func fetchData(urlString: String, completion: @escaping (Result<[CountryModel], Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode),
                  let data = data else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Server error"])))
                return
            }
            
            do {
                let countryData = try JSONDecoder().decode([CountryModel].self, from: data)
                
                completion(.success(countryData))
                
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    func fetchImage(url: URL, completion: @escaping (UIImage?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let data = data, let image = UIImage(data: data) {
                    completion(image)
                } else {
                    completion(nil)
                }
            }
        }.resume()
    }
}
