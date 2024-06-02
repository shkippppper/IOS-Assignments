//
//  LocationDetailedView.swift
//  Assignment28
//
//  Created by Akaki Titberidze on 31.05.24.
//

import SwiftUI

struct LocationDetailedView: View {
    var viewModel: LocationViewModel
    var location: Location
    
    let elementHeight = 250.0
    let columns = [GridItem(.flexible(), spacing: 16), GridItem(.flexible())]
    
    var body: some View {
        ScrollView {
            VStack {
                Text(location.name)
                    .font(.system(size: 24, weight: .semibold))
                VStack {
                    CustomInfoView(leadingText: "Type:", trailingText: location.type)
                    CustomInfoView(leadingText: "Dimension:", trailingText: location.dimension)
                }
                .padding(.horizontal, 16)
                
                if !location.residents.isEmpty {
                    Text("Characters in this location:")
                        .font(.system(size: 20, weight: .semibold))
                        .padding(EdgeInsets(top: 40, leading: 16, bottom: 4, trailing: 16))
                    LazyVGrid(
                        columns: columns,
                        spacing: 20,
                        content: {
                            LocationCharactersView(location: location, viewModel: viewModel)
                        })
                    .padding(16)
                }
            }
        }
    }
}

struct LocationCharactersView: View {
    var location: Location
    var viewModel: LocationViewModel
    @State private var characters: [String: Character] = [:]
    
    var body: some View {
        ForEach(location.residents, id: \.self) { characterURL in
            if let character = characters[characterURL] {
                CustomCharacterCell(
                    imageUrl: character.image,
                    name: character.name,
                    status: character.status,
                    species: character.species
                )
                .transition(.move(edge: .bottom))
            } else {
                ProgressView()
                    .onAppear {
                        viewModel.fetchCharacterData(url: characterURL) { fetchedCharacter in
                            if let fetchedCharacter = fetchedCharacter {
                                characters[characterURL] = fetchedCharacter
                            }
                        }
                    }
            }
        }
    }
}

