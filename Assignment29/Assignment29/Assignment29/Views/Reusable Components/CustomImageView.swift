//
//  CustomImageView.swift
//  Assignment29
//
//  Created by Akaki Titberidze on 07.06.24.
//

import SwiftUI

struct CustomImageView: View {
    let imageUrl: String?
    var imageHeight: CGFloat? = nil
    var imageWidth: CGFloat? = nil
    let cornerRadius: CGFloat
    var onlyBottomRadius: Bool = false
    
    var body: some View {
        if let imageUrl = imageUrl, let _ = URL(string: imageUrl) {
            AsyncImage(url: URL(string: imageUrl)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: imageWidth, height: imageHeight)
                    .clipShape(
                        .rect(
                            topLeadingRadius: !onlyBottomRadius ? cornerRadius : 0,
                            bottomLeadingRadius: cornerRadius,
                            bottomTrailingRadius: cornerRadius,
                            topTrailingRadius: !onlyBottomRadius ? cornerRadius : 0
                        )
                    )
            } placeholder: {
                ProgressView()
                    .frame(width: imageWidth, height: imageHeight)
            }
        } else {
            Color.gray
                .clipped()
        }
    }
}

