//
//  CustomSearchBarView.swift
//  Assignment29
//
//  Created by Akaki Titberidze on 06.06.24.
//

import SwiftUI

struct CustomSearchBarView: View {
    @Binding var searchText: String
    @Binding var selectedSearchType: SearchTypes
    var placeholderText: String
    var onSearch: () -> Void
    var onTypeChange: (_ searchType: SearchTypes) -> Void
    
    var body: some View {
        HStack(spacing: 0) {
            HStack {
                TextField(placeholderText, text: $searchText)
                    .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 8))
                    .foregroundStyle(.customDefaultPrimary)
                
                Image("iconSearchbar")
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 16, height: 16)
                    .padding(EdgeInsets(top: 13, leading: 15, bottom: 13, trailing: 15))
                    .foregroundStyle(.customGrayBlack)
            }
            .frame(height: 42)
            .background(.customSearchBackground)
            .clipShape(RoundedRectangle(cornerRadius: 16.0))
            .padding(.horizontal)
            
            Menu {
                ForEach(SearchTypes.allCases, id: \.self) { type in
                    Button(action: {
                        selectedSearchType = type
                        onTypeChange(selectedSearchType)
                    }) {
                        Label(type.rawValue, systemImage: selectedSearchType == type ? "checkmark" : "")
                    }
                    .foregroundStyle(.customDefaultPrimary)
                }
            } label: {
                Image(systemName: "ellipsis.circle")
                    .resizable()
                    .frame(width: 24, height: 24)
            }
            .padding(.trailing, 24)
        }
        .padding(.bottom, 8)
    }
}

