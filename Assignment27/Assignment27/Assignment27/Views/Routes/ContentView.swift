//
//  ContentView.swift
//  Assignment27
//
//  Created by Akaki Titberidze on 29.05.24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: TravelAppViewModel
    @State private var navPath: [String] = []
    
    var body: some View {
        NavigationStack(path: $navPath) {
            ZStack {
                Color.red.background()
                VStack(spacing: 0) {
                    List {
                        if let cities = viewModel.getTravelData()?.cities {
                            ForEach(cities, id: \.self) { city in
                                ZStack {
                                    NavigationLink(value: city.name) {
                                        EmptyView()
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                    .listRowBackground(Color.clear)
                                    TravelCell(city: city)
                                        .listRowBackground(Color.clear)
                                }
                            }
                            .listRowSeparator(.hidden)
                        } else {
                            Text("Loading")
                        }
                    }
                    .listStyle(PlainListStyle())
                    
                    
                    DefaultButton(buttonTitle: "Travel tips you must know") {
                        viewModel.showRandomTip()
                    }
                    .alert(isPresented: $viewModel.showTravelTip) {
                        Alert(title: Text("Travel Tip"), message: Text(viewModel.travelTip ?? ""), dismissButton: .default(Text("Ok")))
                    }
                    .padding(16)
                    .background(.customGray)
                }
                .navigationTitle("Travel Guide")
                .navigationDestination(for: String.self) { cityName in
                    if let city = viewModel.getTravelData()?.cities.first(where: { $0.name == cityName }) {
                        DestinationDetailScreen(city: city, path: $navPath)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView(viewModel: TravelAppViewModel())
}
