//
//  ContentView.swift
//  Assignment30
//
//  Created by Akaki Titberidze on 17.06.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NewsListingView(viewModel: NewsViewModel())
    }
}

#Preview {
    ContentView()
}
