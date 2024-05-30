//
//  MustSeeView.swift
//  Assignment27
//
//  Created by Akaki Titberidze on 30.05.24.
//

import SwiftUI

struct MustSeeView: View {
    var city: City
    @Binding var path: [String]
    
    var body: some View {
        VStack(spacing: 0) {
            List {
                ForEach(city.must_see, id: \.self) { mustSee in
                    ZStack {
                        TravelDetailsCell(
                            image_url: mustSee.image_url,
                            name: mustSee.name,
                            location: mustSee.location,
                            price_per_annum: mustSee.price_per_annum,
                            rating: mustSee.rating
                        )
                            .listRowBackground(Color.clear)
                    }
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Must See")
            .navigationBarTitleDisplayMode(.inline)
            DefaultButton(buttonTitle: "Go to main menu") {
                path.removeAll()
            }
            .padding(16)
            .background(.customGray)
        }
    }
}
