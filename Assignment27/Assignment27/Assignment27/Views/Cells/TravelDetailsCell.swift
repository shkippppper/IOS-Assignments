//
//  TravelDetailsCell.swift
//  Assignment27
//
//  Created by Akaki Titberidze on 30.05.24.
//

import SwiftUI

struct TravelDetailsCell: View {
    var image_url : String
    var name: String
    var location: String
    var price_per_annum: String
    var rating: Double
    
    var body: some View {
        ZStack {
            TravelDetailsImageView(image_url: image_url)
            Color.black
                .opacity(0.5)
                .clipShape(RoundedRectangle(cornerRadius: 24.0))
                .frame(width: UIScreen.main.bounds.width - 64, height: 248)
            VStack {
                HStack(alignment:.top) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text(name)
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .bold))
                        Text("Address - \(location)")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .bold))
                        Text("Price - \(price_per_annum)")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .bold))
                    }
                    Spacer()
                }
                .padding(32)
                Spacer()
                HStack{
                    TravelDetailsStarView(rating: rating)
                        .padding(32)
                    Spacer()
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width - 32, height: 280)
        .compositingGroup()
        .shadow(color: .customDropShadow, radius: 4, x: 3, y: 4)
    }
}

struct TravelDetailsImageView: View {
    var image_url: String
    
    var body: some View {
        AsyncImage(url: URL(string: image_url)) { image in
            image
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width - 32, height: 280)
                .clipShape(RoundedRectangle(cornerRadius: 24.0))
                .overlay(
                    RoundedRectangle(cornerRadius: 24.0)
                        .stroke(Color.white, lineWidth: 0)
                )
        } placeholder: {
            ProgressView()
                .frame(width: UIScreen.main.bounds.width - 32, height: 280)
        }
    }
}

struct TravelDetailsStarView: View {
    var rating: Double
    
    var body: some View {
        HStack(spacing: 4) {
            ForEach(0..<5) { index in
                if index < Int(rating) {
                    Image(systemName: "star.fill")
                        .foregroundColor(.white)
                } else {
                    Image(systemName: "star")
                        .foregroundColor(.white)
                }
            }
        }
    }
}
