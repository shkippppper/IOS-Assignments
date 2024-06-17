//
//  CustomMovieCard.swift
//  Assignment29
//
//  Created by Akaki Titberidze on 05.06.24.
//

import SwiftUI

struct CustomMovieCard: View {
    var imageUrl: String?
    var title: String
    
    var body: some View {
        VStack(spacing: 10) {
            CustomImageView(
                imageUrl: imageUrl,
                imageHeight: 145.0,
                cornerRadius: 16,
                onlyBottomRadius: false
            )

            VStack(alignment: .leading, spacing: 6) {
                Text(title)
                    .font(.system(size: 12, weight: .bold))
                    .foregroundStyle(.customDefaultPrimary)
                    .lineLimit(2)
                    .frame(height: 30, alignment: .top)
                Spacer()
            }
        }
        .background(.customBackground)
    }
}

