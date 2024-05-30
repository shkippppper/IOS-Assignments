//
//  MainView.swift
//  Assignment26
//
//  Created by Akaki Titberidze on 27.05.24.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var viewModel: ShopViewModel
    
    var body: some View {
        List {
            ForEach(Array(viewModel.shopItems.enumerated()), id: \.element.hashValue) { index, item in
                ShopItemCell(
                    name: item.name,
                    price: String(item.price),
                    availableQuantity: item.availableQuantity,
                    wantedQuantity: item.wantedQuantity,
                    image: item.image,
                    plusButtonClicked: {viewModel.incrementQuantity(index: index)},
                    minusButtonClicked: {viewModel.decrementQuantity(index: index)},
                    trashButtonClicked: {viewModel.clearQuantity(index: index)}
                )
                .listRowBackground(Color.clear)
                .listRowInsets(EdgeInsets())
            }
            .listRowSeparator(.hidden)
        }
        .listStyle(PlainListStyle())
    }
}

