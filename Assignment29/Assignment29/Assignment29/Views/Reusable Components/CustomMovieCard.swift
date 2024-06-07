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
    var releaseDate: String
    var voteAverage: Double
    var voteCount: Int
    var genres: [String]
    
    var body: some View {
        let elementHeight = 320.0
        let elementWidth = 200.0
        
        VStack(spacing: 0) {
            ZStack {
                if let imageUrl = imageUrl, let _ = URL(string: imageUrl) {
                    AsyncImage(url: URL(string: imageUrl)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: elementHeight - 50)
                            .overlay(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.black.opacity(0.0), Color.black.opacity(0.9)]),
                                    startPoint: .center,
                                    endPoint: .bottom
                                )
                            )
                            .mask(
                                Rectangle()
                                    .fill(
                                        LinearGradient(
                                            gradient: Gradient(colors: [Color.clear, Color.black]),
                                            startPoint: .top,
                                            endPoint: .bottom
                                        )
                                    )
                                    .blur(radius: 100, opaque: true)
                            )
                    } placeholder: {
                        ProgressView()
                            .frame(height: elementHeight - 50)
                    }
                } else {
                    Color.gray
                        .frame(width: elementWidth, height: elementHeight)
                        .clipped()
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Spacer()
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack {
                            ForEach(genres, id: \.self) { genre in
                                Text(genre)
                                    .font(.system(size: 10))
                                    .foregroundStyle(.customSecondary)
                                    .padding(.horizontal, 2)
                            }
                        }
                    }
                    .frame(height: 20)
                    HStack {
                        CustomRatingView(rating: voteAverage / 2, smallSize: true)
                        Text("\(voteCount) REVIEWS")
                            .font(.system(size: 10, weight: .bold))
                            .foregroundStyle(.gray)
                            .lineLimit(1)
                        Spacer()
                    }
                }
                .padding([.leading, .bottom], 10)
            }
            .clipped()
            
            VStack(alignment: .leading, spacing: 6) {
                HStack(spacing: 0) {
                    Text(title)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(.gray)
                        .lineLimit(1)
                    Spacer()
                }
                Text(releaseDate)
                    .font(.system(size: 10, weight: .semibold))
                    .foregroundStyle(.gray)
                    .opacity(0.7)
                    .lineLimit(1)
            }
            .padding(10)
        }
        .frame(maxWidth: elementWidth, maxHeight: elementHeight)
        .background(.customBackground)
        .clipShape(RoundedRectangle(cornerRadius: 8.0))
        .overlay(
            RoundedRectangle(cornerRadius: 8.0)
                .stroke(Color.customBackground.opacity(0.6), lineWidth: 5)
        )
        .shadow(color: .customBackground, radius: 4, x: 3, y: 4)
    }
}
