//
//  CharacterView.swift
//  Assignment28
//
//  Created by Akaki Titberidze on 31.05.24.
//

import SwiftUI

struct CharacterView: View {
    @ObservedObject var viewModel: CharacterViewModel
    let columns = [GridItem(.flexible(), spacing: 16), GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid( columns: columns,
                           spacing: 20,
                           content: {
                    ForEach(viewModel.getCharactersData(), id: \.self) { character in
                        ZStack {
                            NavigationLink(destination: CharacterDetailedView(viewModel: viewModel, character: character)) {
                                CustomCharacterCell(
                                    imageUrl: character.image,
                                    name: character.name,
                                    status: character.status,
                                    species: character.species
                                )
                            }
                            .buttonStyle(PlainButtonStyle())
                            .listRowBackground(Color.clear)
                            .onAppear {
                                viewModel.loadMoreCharacters(currentItem: character)
                            }
                        }
                    }
                })
                .padding(16)
                .navigationTitle("Characters")
                .navigationDestination(for: Character.self) { character in
                    CharacterDetailedView(viewModel: viewModel, character: character)
                }
            }
        }
    }
}

#Preview {
    CharacterView(viewModel: CharacterViewModel())
}
