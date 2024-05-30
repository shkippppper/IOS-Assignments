//
//  HotelsView.swift
//  Assignment27
//
//  Created by Akaki Titberidze on 30.05.24.
//

import SwiftUI

struct HotelsView: View {
    var city: City
    @Binding var path: [String]
    
    var body: some View {
        VStack(spacing: 0) {
            List {
                ForEach(city.hotels, id: \.self) { hotels in
                    ZStack {
                        TravelDetailsCell(
                            image_url: hotels.image_url,
                            name: hotels.name,
                            location: hotels.location,
                            price_per_annum: hotels.price_per_annum,
                            rating: hotels.rating
                        )
                            .listRowBackground(Color.clear)
                    }
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Hotels")
            .navigationBarTitleDisplayMode(.inline)
            DefaultButton(buttonTitle: "Go to main menu") {
                path.removeAll()
            }
            .padding(16)
            .background(.customGray)
        }
    }
}

