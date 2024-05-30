//
//  HeaderView.swift
//  Assignment26
//
//  Created by Akaki Titberidze on 27.05.24.
//

import SwiftUI

struct HeaderView: View {
    // MARK: Variables
    @ObservedObject var viewModel: ShopViewModel
    
    // MARK: View
    var body: some View {
        HStack {
            Button(action: {
                // go back to listing
            }){
                Image(.chevronLeftIcon)
                    .renderingMode(.template)
                    .resizable()
                    .frame(maxWidth: 30, maxHeight: 30)
                    .aspectRatio(contentMode: .fit)
                    .padding(.trailing, 10)
                    .foregroundStyle(.darkGreen)
            }
            Text("ბოსტნეული")
                .font(.system(size: 30, weight: .semibold))
                .foregroundStyle(.background)
            Spacer()
            Image(systemName: "percent")
                .resizable()
                .padding(3)
                .frame(maxWidth: 20, maxHeight: 20)
                .aspectRatio(contentMode: .fit)
                .padding(5)
                .background(.background)
                .clipShape(Circle())
                .onTapGesture {
                    viewModel.applyDiscountToAll()
                }
            Image(.vegetablesIcon)
                .resizable()
                .frame(maxWidth: 60, maxHeight: 60)
                .aspectRatio(contentMode: .fit)
                .padding(3)
                .background(.white)
                .clipShape(Circle())
        }
        .frame(maxWidth: .infinity, maxHeight: 60)
        .padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
        .background(.mainGreen)
    }
}
