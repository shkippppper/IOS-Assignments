//
//  NetworkManager.swift
//  UnitTestingAssignment
//
//  Created by Chuck Norris on 11.05.1992.
//

import Foundation

final public class NetworkManager {
    static var shared = NetworkManager()
    private let productsUrlString = "https://dummyjson.com/products"
    private var session: URLSession
    
    public init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func fetchProducts(completion: @escaping (Result<[Product], Error>) -> Void) {
        guard let url = URL(string: productsUrlString) else {
            completion(.failure(NSError(domain: "URL Error", code: -1, userInfo: nil)))
            return
        }
        
        session.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "Data Error", code: -1, userInfo: nil)))
                return
            }
            
            do {
                let productsResponse = try JSONDecoder().decode(Sasass.self, from: data)
                completion(.success(productsResponse.products))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
