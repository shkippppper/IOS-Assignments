//
//  TravelData.swift
//  Assignment27
//
//  Created by Akaki Titberidze on 29.05.24.
//

import Foundation

struct TravelData: Hashable, Codable {
    var travel_tips: [String]
    var cities: [City]
}

struct City: Hashable, Codable {
    var name: String
    var country_name: String
    var image_url: String
    var country_detail: String
    var avg_temperature: Int
    var rating: Double
    var currency: String
    var average_daily_cost: String
    var transportation_details: TransportationDetails
    var must_see: [MustSee]
    var hotels: [Hotel]
}

struct TransportationDetails: Hashable, Codable {
    var location_to_airport: String
    var airport_to_airport: String
    var airport_to_location: String
}

struct MustSee: Hashable, Codable {
    var name: String
    var location: String
    var rating: Double
    var image_url: String
    var price_per_annum: String
}

struct Hotel: Hashable, Codable {
    var name: String
    var location: String
    var rating: Double
    var image_url: String
    var price_per_annum: String
}
