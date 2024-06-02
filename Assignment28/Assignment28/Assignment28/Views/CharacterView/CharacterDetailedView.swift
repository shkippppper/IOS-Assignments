//
//  CharacterDetailedView.swift
//  Assignment28
//
//  Created by Akaki Titberidze on 31.05.24.
//

import SwiftUI

struct CharacterDetailedView: View {
    var viewModel: CharacterViewModel
    var character: Character
    
    let elementHeight = 250.0
    let columns = [GridItem(.flexible(), spacing: 16), GridItem(.flexible())]
    
    var body: some View {
        ScrollView {
            VStack {
                Text(character.name)
                    .font(.system(size: 24, weight: .semibold))
                
                AsyncImage(url: URL(string: character.image)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: UIScreen.main.bounds.size.width - 32, maxHeight: elementHeight)
                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                } placeholder: {
                    ProgressView()
                        .frame(width: UIScreen.main.bounds.size.width - 32, height: elementHeight)
                }
                
                
                VStack {
                    CustomInfoView(leadingText: "Gender:", trailingText: character.gender)
                    CustomInfoView(leadingText: "Status:", trailingText: character.status)
                    CustomInfoView(leadingText: "Specie:", trailingText: character.species)
                    CustomInfoView(leadingText: "Origin:", trailingText: character.origin.name)
                }
                .padding(.horizontal, 16)
                
                
                if !character.episode.isEmpty {
                    Text("Appears in:")
                        .font(.system(size: 20, weight: .semibold))
                        .padding(EdgeInsets(top: 40, leading: 16, bottom: 4, trailing: 16))
                    LazyVStack(
                        spacing: 20,
                        content: {
                            ForEach(character.episode, id: \.self) { episode in
                                CustomEpisodeView(viewModel: viewModel, episodeUrl: episode)
                            }
                            .buttonStyle(PlainButtonStyle())
                            .listRowBackground(Color.clear)
                        })
                    .padding(16)
                }
            }
        }
    }
}

#Preview {
    CharacterDetailedView(
        viewModel: CharacterViewModel(),
        character: Character(
            id: 1,
            name: "Rick Sanchez",
            status: "Alive",
            species: "Human",
            gender: "Male",
            image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
            episode: ["https://rickandmortyapi.com/api/episode/1",
                      "https://rickandmortyapi.com/api/episode/2",
                      "https://rickandmortyapi.com/api/episode/3",],
            url: "https://rickandmortyapi.com/api/character/1",
            origin: Origin.init(name: "Earth")
        )
    )
}
