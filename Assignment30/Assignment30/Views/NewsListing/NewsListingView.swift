//
//  NewsListingView.swift
//  Assignment30
//
//  Created by Akaki Titberidze on 17.06.24.
//

import SwiftUI

struct NewsListingView: View {
    @StateObject var viewModel: NewsViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                NewsListTableView(newsList: $viewModel.news, viewModel: viewModel)
                    .padding(10)
                    .navigationTitle("News")
            }
        }
    }
}

#Preview {
    NewsListingView(viewModel: NewsViewModel())
}
