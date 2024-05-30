//
//  ContentView.swift
//  Assignment26
//
//  Created by Akaki Titberidze on 27.05.24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ShopViewModel
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                HeaderView(viewModel: viewModel)
                MainView(viewModel: viewModel)
                FooterView(viewModel: viewModel)
            }
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    ContentView(viewModel: ShopViewModel())
}
