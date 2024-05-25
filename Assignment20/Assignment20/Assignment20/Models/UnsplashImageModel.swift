//
//  UnsplashImageModel.swift
//  Assignment20
//
//  Created by Akaki Titberidze on 09.05.24.
//

import Foundation

struct UnsplashImageModel: Codable, Hashable {
    var alt_description: String
    var urls: URLS
}

struct URLS: Codable, Hashable {
    var regular: String
}
