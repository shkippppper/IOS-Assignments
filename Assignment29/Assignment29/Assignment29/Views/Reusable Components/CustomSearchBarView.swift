//
//  CustomSearchBarView.swift
//  Assignment29
//
//  Created by Akaki Titberidze on 06.06.24.
//

import SwiftUI

struct CustomSearchBarView: View {
    @Binding var searchText: String
    var onSearch: () -> Void
    
    var body: some View {
        HStack {
            TextField("Search with name", text: $searchText)
                .padding(.leading, 8)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .background(Color.customBackground.opacity(0.8))
            Button(action: {
                onSearch()
            }) {
                Text("Search")
                    .padding(8)
                    .background(.customSecondary)
                    .foregroundStyle(.black)
                    .cornerRadius(8)
            }
        }
        .padding(8)
    }
}

