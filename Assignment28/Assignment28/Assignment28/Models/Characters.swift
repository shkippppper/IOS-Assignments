//
//  Characters.swift
//  Assignment28
//
//  Created by Akaki Titberidze on 31.05.24.
//

import Foundation

struct Characters: Hashable, Codable {
    var info: Info
    var results: [Character]
}

struct Info: Hashable, Codable {
    var count: Int
    var pages: Int
    let next: String?
}

struct Character: Hashable, Codable {
    var id: Int
    var name: String
    var status: String
    var species: String
    var gender: String
    var image: String
    var episode: [String]
    var url: String
    var origin: Origin
}

struct Origin: Hashable, Codable {
    var name: String
}
