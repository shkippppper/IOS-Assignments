//
//  News.swift
//  Assignment30
//
//  Created by Akaki Titberidze on 17.06.24.
//

import Foundation

struct News: Codable, Hashable {
    var articles: [SingleNews]
}

struct SingleNews: Codable, Hashable {
    var source: NewsSource
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
}

struct NewsSource: Codable, Hashable {
    var name: String?
}
