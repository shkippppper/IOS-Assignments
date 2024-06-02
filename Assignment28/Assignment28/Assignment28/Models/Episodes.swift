//
//  Episodes.swift
//  Assignment28
//
//  Created by Akaki Titberidze on 31.05.24.
//

import Foundation

struct Episodes: Codable {
    let info: Info
    let results: [Episode]
}

struct Episode: Codable, Hashable {
    var id: Int
    var name: String
    var air_date: String
    var episode: String
    var characters: [String]
    var url: String
}
