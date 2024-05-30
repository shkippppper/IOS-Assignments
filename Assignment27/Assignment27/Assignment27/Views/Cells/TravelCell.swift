//
//  TravelCell.swift
//  Assignment27
//
//  Created by Akaki Titberidze on 30.05.24.
//

import SwiftUI

struct TravelCell: View {
    var city: City
    
    var body: some View {
            ZStack {
                AsyncImage(url: URL(string: city.image_url)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width - 32, height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 24.0))
                        .overlay(
                            RoundedRectangle(cornerRadius: 24.0)
                                .stroke(Color.white, lineWidth: 0)
                        )
                } placeholder: {
                    ProgressView()
                        .frame(width: UIScreen.main.bounds.width - 32, height: 200)
                }
                Color.black
                    .opacity(0.5)
                    .clipShape(RoundedRectangle(cornerRadius: 24.0))
                VStack {
                    Spacer()
                    HStack(alignment:.top) {
                        Image("pinpointIcon")
                            .resizable()
                            .frame(width: 14, height: 16)
                            .foregroundColor(.white)
                            .padding(.top, 6)
                        VStack(alignment: .leading) {
                            Text(city.name)
                                .foregroundColor(.white)
                                .font(.system(size: 22, weight: .bold))
                            Text(city.country_name)
                                .foregroundColor(.white)
                                .font(.system(size: 22))
                        }
                        Spacer()
                    }
                    .padding(16)
                }
                
            }
            .frame(width: UIScreen.main.bounds.width - 32, height: 200)
            .compositingGroup()
            .shadow(color: .customDropShadow, radius: 4, x: 3, y: 4)
    }
}
