//
//  Locations.swift
//  Assignment28
//
//  Created by Akaki Titberidze on 31.05.24.
//

import Foundation

struct Locations: Codable {
    let info: Info
    let results: [Location]
}

struct Location: Codable, Hashable {
    var id: Int
    var name: String
    var type: String
    var residents: [String]
    var url: String
    var dimension: String
}
