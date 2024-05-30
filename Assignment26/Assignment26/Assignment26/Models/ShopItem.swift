//
//  ShopItem.swift
//  Assignment26
//
//  Created by Akaki Titberidze on 27.05.24.
//

import Foundation

struct ShopItem: Hashable {
    var name: String
    var price: Double
    var availableQuantity: Int // optional
    var wantedQuantity: Int
    var image: String
    var isDiscounted: Bool
}
