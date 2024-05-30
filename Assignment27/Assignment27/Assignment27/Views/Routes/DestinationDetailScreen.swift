//
//  DestinationDetailScreen.swift
//  Assignment27
//
//  Created by Akaki Titberidze on 30.05.24.
//

import SwiftUI

struct DestinationDetailScreen: View {
    var city: City
    @Binding var path: [String]
    
    var body: some View {
        ZStack {
            Color.customBackground
            VStack(spacing: 16) {
                TravelDetailedImageView(city: city)
                ScrollView {
                    VStack(alignment: .leading, spacing: 12) {
                        VStack(alignment: .leading, spacing: -8) {
                            Text(city.name)
                                .font(.system(size: 30, weight: .bold))
                            Text(city.country_name)
                                .font(.system(size: 30, weight: .regular))
                        }
                        Text(city.country_detail)
                            .font(.system(size: 16, weight: .regular))
                            .fixedSize(horizontal: false, vertical: true)
                            .lineLimit(3)
                            .truncationMode(.tail)
                            .frame(height: 60)
                        
                        HStack(spacing: 16) {
                            DefaultTag(image: "dollarsign.arrow.circlepath", text: city.average_daily_cost)
                            DefaultTag(image: "dollarsign.circle", text: city.currency)
                            DefaultTag(image: "star", text: city.rating.description)
                        }
                        .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 40)
                        
                        TravelDetailedButtonsView(city: city, path: $path)
                    }
                    .padding(16)
                    .background(Color.customGray)
                    .clipShape(RoundedRectangle(cornerRadius: 24.0))
                }
            }
            .padding(16)
        }
        .padding(.top, 84)
        .ignoresSafeArea()
    }
}

struct TravelDetailedImageView: View {
    var city: City
    var body: some View {
        AsyncImage(url: URL(string: city.image_url)) { image in
            image
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width - 32, height: 310)
                .clipShape(RoundedRectangle(cornerRadius: 24.0))
                .overlay(
                    RoundedRectangle(cornerRadius: 24.0)
                        .stroke(Color.white, lineWidth: 0)
                )
        } placeholder: {
            ProgressView()
                .frame(width: UIScreen.main.bounds.width - 32, height: 310)
        }
    }
}
struct TravelDetailedButtonsView: View {
    var city: City
    @Binding var path: [String]
    
    @State private var transportActive = false
    @State private var mustSeeActive = false
    @State private var hotelActive = false

    // სხვანაირად არ გამოდიოდა DefaultButton-ის გამოყენება.
    
    var body: some View {
        VStack(spacing: 8) {
            NavigationLink(destination: TransportView(city: city, path: $path), isActive: $transportActive) {}
            DefaultButton(buttonTitle: "Transport") {
                transportActive = true
            }
            
            NavigationLink(destination: MustSeeView(city: city, path: $path), isActive: $mustSeeActive) {}
            DefaultButton(buttonTitle: "Must See") {
                mustSeeActive = true
            }

            NavigationLink(destination: HotelsView(city: city, path: $path), isActive: $hotelActive) {}
            DefaultButton(buttonTitle: "Hotels") {
                hotelActive = true
            }
        }
    }
}
