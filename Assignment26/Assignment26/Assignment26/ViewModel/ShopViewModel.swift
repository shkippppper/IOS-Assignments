//
//  ShopViewModel.swift
//  Assignment26
//
//  Created by Akaki Titberidze on 27.05.24.
//

import Foundation

class ShopViewModel: ObservableObject {
    // MARK: Variables
    var shopItems: [ShopItem] = []
    @Published var totalDiscount: Double = 0
    @Published var totalPrice: Double = 0
    @Published var totalProducts: Int = 0
    
    // MARK: Lifecycle
    init() {
        loadItems()
    }
    
    func loadItems() {
        self.shopItems = shopData
    }
    
    // MARK: Helper Functions
    func incrementQuantity(index: Int) {
        guard shopItems.indices.contains(index),
              shopItems[index].availableQuantity > shopItems[index].wantedQuantity-1 else { return }
        
        shopItems[index].wantedQuantity += 1
        totalPrice +=  shopItems[index].price
        totalProducts += 1
    }
    
    func decrementQuantity(index: Int) {
        guard shopItems.indices.contains(index), shopItems[index].wantedQuantity > 0 else { return }
        
        totalPrice -= shopItems[index].price
        shopItems[index].wantedQuantity -= 1
        totalProducts -= 1
    }
    
    func clearQuantity(index: Int) {
        guard shopItems.indices.contains(index) else { return }
        
        totalPrice -= Double(shopItems[index].wantedQuantity) * shopItems[index].price
        totalProducts -= shopItems[index].wantedQuantity
        shopItems[index].wantedQuantity = 0
    }
    
    func applyDiscountToAll() {
        let randomNumber = getRandomDiscount()
        totalPrice = 0
        for index in shopItems.indices {
            if !shopItems[index].isDiscounted {
                let discountedPrice = shopItems[index].price * randomNumber
                shopItems[index].price = (discountedPrice * 100).rounded() / 100
                shopItems[index].isDiscounted = true
                totalPrice += (shopItems[index].price * Double(shopItems[index].wantedQuantity) * 100).rounded() / 100
            }
        }
    }
    
    func getRandomDiscount() -> Double {
        0.8
    }
}
