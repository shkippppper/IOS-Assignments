//
//  FactsModel.swift
//  Assignment19
//
//  Created by Akaki Titberidze on 03.05.24.
//

import Foundation

struct FactsModel: Codable {
    var data: [Fact]
    var next_page_url: String
}

struct Fact: Codable {
    let fact: String
}
