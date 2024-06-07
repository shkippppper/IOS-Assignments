//
//  Genres.swift
//  Assignment29
//
//  Created by Akaki Titberidze on 05.06.24.
//

import Foundation

struct Genres: Codable, Hashable{
    var genres: [Genre]
}

struct Genre: Codable, Hashable {
    var id: Int
    var name: String
}
