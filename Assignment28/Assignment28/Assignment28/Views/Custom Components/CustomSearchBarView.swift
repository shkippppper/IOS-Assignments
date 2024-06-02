//
//  CustomSearchBarView.swift
//  Assignment28
//
//  Created by Akaki Titberidze on 01.06.24.
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
            Button(action: {
                onSearch()
            }) {
                Text("Search")
                    .padding(8)
                    .background(.customGray)
                    .foregroundStyle(.black)
                    .cornerRadius(8)
            }
        }
        .padding(8)
    }
}
