//
//  CountryModel.swift
//  Assignment16
//
//  Created by Akaki Titberidze on 22.04.24.
//

import Foundation

struct CountryModel: Codable {
    let name: Name
    let independent: Bool?
    let unMember: Bool?
    let region: String?
    let subregion: String?
    let flag: String?
    let maps: Links
    let population: Int?
    let flags: Flags
    let startOfWeek: String?
    
}

struct Name: Codable{
    let common: String?
    let official: String?
}

struct Links: Codable{
    let googleMaps: String?
    let openStreetMaps: String?
}

struct Flags: Codable{
    let png: String?
    let alt: String?
}

struct CoatOfArms: Codable{
    let png: String?
}
