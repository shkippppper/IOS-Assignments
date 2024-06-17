//
//  CustomSearchMovieCard.swift
//  Assignment29
//
//  Created by Akaki Titberidze on 07.06.24.
//

import SwiftUI

struct CustomSearchMovieCard: View {
    var imageUrl: String?
    var title: String
    var releaseDate: String
    var voteAverage: Double
    var runTime: Int
    var genres: String
    
    var body: some View {
        HStack(spacing: 12) {
            CustomImageView(
                imageUrl: imageUrl,
                imageHeight: 120.0,
                imageWidth: 95.0,
                cornerRadius: 16
            )
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundStyle(.customPrimary)
                    .lineLimit(2)
                    .frame(height: 30, alignment: .top)
                    .padding(.top, 6)
                infoLayout(imageName: "iconStarOrange", color: .customOrange, title:  String(format: "%.1f", voteAverage))
                infoLayout(imageName: "iconTicket", color: .primary, title: genres)
                infoLayout(imageName: "iconCalendar", color: .primary, title: String(releaseDate.prefix(4)))
                infoLayout(imageName: "iconClock", color: .primary, title: "\(runTime) minutes")
                    .padding(.bottom, 6)
            }
            Spacer()
        }
        .frame(height: 120)
        .background(.customBackground)
    }
    
    func infoLayout(imageName: String, color: Color, title: String) -> some View {
        HStack(spacing: 4) {
            Image(imageName)
                .renderingMode(.template)
                .resizable()
                .frame(width: 16, height: 16)
                .foregroundStyle(color)
            Text(title)
                .font(.system(size: 12))
                .foregroundStyle(color)
        }
    }
}
