//
//  Movies.swift
//  Assignment29
//
//  Created by Akaki Titberidze on 05.06.24.
//

import Foundation

struct Movies: Codable, Hashable {
    var page: Int?
    var results: [Movie]
    var total_pages: Int?
    var total_results: Int?
}


struct Movie: Codable, Hashable {
    var adult: Bool?
    var backdrop_path: String? //image for detailed
    var genre_ids: [Int]?
    var id: Int?
    var original_language: String?
    var overview: String?
    var popularity: Double?
    var poster_path: String? //image for listing
    var release_date: String?
    var title: String?
    var vote_average: Double?
    var vote_count: Int?
}
