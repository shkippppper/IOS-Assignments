//
//  FooterView.swift
//  Assignment26
//
//  Created by Akaki Titberidze on 27.05.24.
//

import SwiftUI

struct FooterView: View {
    // MARK: Variables
    @ObservedObject var viewModel: ShopViewModel

    // MARK: View
    
    var body: some View {
        VStack {
            CheckoutDetailView(label: "ცალი პროდუქტი:", value: "\(viewModel.totalProducts)ც")
            CheckoutDetailView(label: "ჯამი", value: "\(viewModel.totalPrice)₾")
            Button(action: {
                
            }){
                Link("გადახდა", destination: URL(string: "https://www.google.com")!)
                    .frame(maxWidth: .infinity)
                    .padding(8)
                    .background(.darkGreen)
                    .foregroundStyle(.white)
                    .font(.system(size: 20, weight: .semibold))
                    .clipShape(RoundedRectangle(cornerRadius: 16.0))
            }
            .frame(maxWidth: .infinity)
        }
        .frame(maxWidth: .infinity, maxHeight: 120)
        .padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16))
        .background(.mainGreen)
    }
}
