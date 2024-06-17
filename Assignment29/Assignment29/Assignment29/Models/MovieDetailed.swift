//
//  MovieDetailed.swift
//  Assignment29
//
//  Created by Akaki Titberidze on 07.06.24.
//

import Foundation
import SwiftData

struct MovieDetailed: Codable, Hashable {
    var genres: [Genre]
    var runtime: Int
}

@Model
class MovieDetailedSwiftData {
    var backdrop_path: String
    var id: Int
    var overview: String
    var poster_path: String
    var release_date: String
    var title: String
    var vote_average: Double
    var genres: String
    var runtime: Int

    init(backdrop_path: String, id: Int, overview: String, poster_path: String, release_date: String, title: String, vote_average: Double, genres: String, runtime: Int) {
        self.backdrop_path = backdrop_path
        self.id = id
        self.overview = overview
        self.poster_path = poster_path
        self.release_date = release_date
        self.title = title
        self.vote_average = vote_average
        self.genres = genres
        self.runtime = runtime
    }
}
