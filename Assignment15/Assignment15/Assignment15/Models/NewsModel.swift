//
//  NewsModel.swift
//  Assignment15
//
//  Created by Akaki Titberidze on 20.04.24.
//

import Foundation

struct NewsModel: Codable {
    let title: String
    let time: String
    let url: String
    let photoUrl: String
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case time = "Time"
        case url = "Url"
        case photoUrl = "PhotoUrl"
    }
}

struct ListWrapper: Codable {
    let list: [NewsModel]

    enum CodingKeys: String, CodingKey {
        case list = "List"
    }
}
