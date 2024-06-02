//
//  CustomCharacterCell.swift
//  Assignment28
//
//  Created by Akaki Titberidze on 31.05.24.
//

import SwiftUI

struct CustomCharacterCell: View {
    var imageUrl: String
    var name: String
    var status: String
    var species: String
    
    
    var body: some View {
        let elementHeight = 250.0
        let elementWidth = 200.0
        
        VStack {
            AsyncImage(url: URL(string: imageUrl)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: elementWidth, maxHeight: elementHeight)
                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
            } placeholder: {
                ProgressView()
                    .frame(height: elementHeight)
            }
            Text(name)
                .font(.system(size: 18, weight: .bold))
                .lineLimit(1)
            Text("\(species), \(status)")
                .font(.system(size: 16))
                .lineLimit(1)
        }
    }
}
