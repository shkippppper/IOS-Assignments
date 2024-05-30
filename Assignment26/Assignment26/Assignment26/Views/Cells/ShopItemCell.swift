//
//  ShopItemCell.swift
//  Assignment26
//
//  Created by Akaki Titberidze on 27.05.24.
//

import SwiftUI

struct ShopItemCell: View {
    // MARK: Variables
    var name: String
    var price: String
    var availableQuantity: Int
    var wantedQuantity: Int
    var image: String
    
    var plusButtonClicked: () -> Void
    var minusButtonClicked: () -> Void
    var trashButtonClicked: () -> Void
    
    // MARK: View
    var body: some View {
        HStack {
            if wantedQuantity > 0 {
                RoundedRectangle(cornerRadius: 8.0)
                    .frame(width: 6)
                    .foregroundStyle(.darkGreen)
                
                Image(systemName: "trash")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.red)
                    .onTapGesture {
                        trashButtonClicked()
                    }
            }
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .padding(.leading, 3)
            VStack(alignment: .leading, spacing: 10) {
                Text(name)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(.primary)
                Text("\(price)₾")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundStyle(.darkGreen)
            }
            Spacer()
            HStack(spacing: 4){
                Image(systemName: "minus")
                    .frame(width: 26, height: 26)
                    .background(.customGray)
                    .foregroundStyle(.black)
                    .clipShape(Circle())
                    .opacity(wantedQuantity > 0 ? 1.0 : 0.2)
                    .onTapGesture {
                        minusButtonClicked()
                    }
                
                Text("\(wantedQuantity)")
                    .font(.system(size: 22, weight: .semibold))
                    .frame(width: 34, height: 34)
                    .foregroundStyle(.background)
                    .background(.mainGreen)
                    .clipShape(Circle())
                
                Image(systemName: "plus")
                    .frame(width: 26, height: 26)
                    .background(.customGray)
                    .foregroundStyle(.black)
                    .clipShape(Circle())
                    .opacity(wantedQuantity < availableQuantity ? 1.0 : 0.2)
                    .onTapGesture {
                        plusButtonClicked()
                    }
            }
            .frame(maxHeight: .infinity)
        }
        //        .frame(height: 90)
        .frame(maxWidth: .infinity, maxHeight: 90)
        .cornerRadius(8)
        .padding(EdgeInsets(top: 3, leading: 0, bottom: 3, trailing: 16))
    }
}

