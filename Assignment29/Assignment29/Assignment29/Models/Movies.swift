//
//  Movies.swift
//  Assignment29
//
//  Created by Akaki Titberidze on 05.06.24.
//

import Foundation
import SwiftData

struct Movies: Codable, Hashable {
    var page: Int?
    var results: [Movie]
    var total_pages: Int?
    var total_results: Int?
}


struct Movie: Codable, Hashable {
    var backdrop_path: String?
    var id: Int?
    var overview: String?
    var poster_path: String?
    var release_date: String?
    var title: String?
    var vote_average: Double?
}
