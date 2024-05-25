//
//  URLData.swift
//  Assignment20
//
//  Created by Akaki Titberidze on 09.05.24.
//

import Foundation

final class URLData {
    var baseURL = "https://api.unsplash.com/"
    var path = "photos"
    var pageQuery = "?page=1"
    var perPageQuery = "&per_page=100"
    var clientIDQuery = "&client_id=\(ApiKey().apiKey)"
    
    var url: String
    
    init(baseURL: String = "https://api.unsplash.com/", path: String = "photos", pageQuery: String = "?page=1", perPageQuery: String = "&per_page=100", clientIDQuery: String = "&client_id=\(ApiKey().apiKey)") {
        self.baseURL = baseURL
        self.path = path
        self.pageQuery = pageQuery
        self.perPageQuery = perPageQuery
        self.clientIDQuery = clientIDQuery
        
        self.url = "\(baseURL)\(path)\(pageQuery)\(perPageQuery)\(clientIDQuery)"
    }
}

