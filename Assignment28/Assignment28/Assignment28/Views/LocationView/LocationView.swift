//
//  LocationView.swift
//  Assignment28
//
//  Created by Akaki Titberidze on 31.05.24.
//

import SwiftUI

import SwiftUI

struct LocationView: View {
    @ObservedObject var viewModel: LocationViewModel
    let columns = [GridItem(.flexible(), spacing: 16)]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid( columns: columns,
                           spacing: 20,
                           content: {
                    ForEach(viewModel.getLocationsData(), id: \.self) { location in
                        ZStack {
                            NavigationLink(destination: LocationDetailedView(viewModel: viewModel, location: location)) {
                            CustomLocationCell(name: location.name, type: location.type)
                            }
                            .buttonStyle(PlainButtonStyle())
                            .listRowBackground(Color.clear)
                            .onAppear {
                                viewModel.loadMoreLocations(currentItem: location)
                            }
                        }
                    }
                })
                .padding(16)
                .navigationTitle("Locations")
                .navigationDestination(for: Location.self) { location in
                    LocationDetailedView(viewModel: viewModel, location: location)
                }
            }
        }
    }
}

#Preview {
    LocationView(viewModel: LocationViewModel())
}
