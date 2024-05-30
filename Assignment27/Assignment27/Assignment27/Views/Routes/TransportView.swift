//
//  TransportView.swift
//  Assignment27
//
//  Created by Akaki Titberidze on 30.05.24.
//

import SwiftUI

struct TransportView: View {
    var city: City
    @Binding var path: [String]
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                VStack(alignment: .leading) {
                    CircleView(text: "Your Location")
                    LineView(withArrow: false)
                    VehicleView(text: city.transportation_details.location_to_airport, vehicle: "car.fill")
                    LineView(withArrow: true)
                    
                    CircleView(text: "Your Local Airport")
                    LineView(withArrow: false)
                    VehicleView(text: city.transportation_details.airport_to_airport, vehicle: "airplane")
                    LineView(withArrow: true)

                    CircleView(text: "\(city.name) Airport")
                    LineView(withArrow: false)
                    VehicleView(text: city.transportation_details.location_to_airport, vehicle: "car.fill")
                    LineView(withArrow: true)
                    CircleView(text: "Hotel In \(city.name)")
                    
                    Spacer()
                }
                .navigationBarTitleDisplayMode(.inline)
                Spacer()
            }
            .padding(EdgeInsets(top: 18, leading: 36, bottom: 0, trailing: 0))
            DefaultButton(buttonTitle: "Go to main menu") {
                path.removeAll()
            }
            .padding(16)
            .background(.customGray)
        }

    }
}

struct CircleView: View {
    var text: String
    var body: some View {
        HStack(spacing:16) {
            Circle()
                .fill(Color.customBackground)
                .frame(width: 24, height: 24)
                .overlay(
                    Circle()
                        .stroke(Color.customPrimary, lineWidth: 2)
                )
            Text(text)
                .font(.system(size: 14, weight: .bold))
        }
    }
}

struct LineView: View {
    var withArrow: Bool
    var body: some View {
        VStack(spacing: 0) {
            Rectangle()
                .fill(Color.customGray)
                .frame(width: 2, height: withArrow ? 40 : 50)
            if withArrow {
                Image(systemName: "arrowtriangle.down.fill")
                    .resizable()
                    .foregroundColor(.customGray)
                    .frame(width: 12, height: 12)
            }
        }
        .padding(.leading, withArrow ? 6 : 11)
        .padding(.bottom, 4)
    }
}

struct VehicleView: View {
    var text: String
    var vehicle: String
    var body: some View {
        HStack(spacing:16) {
            Image(systemName: vehicle)
                .resizable()
                .foregroundColor(.customGray)
                .frame(width: 24, height: 24)
            Text(text)
                .font(.system(size: 14, weight: .regular))
                .opacity(0.6)
        }
    }
}
