//
//  EpisodeDetailedView.swift
//  Assignment28
//
//  Created by Akaki Titberidze on 31.05.24.
//


import SwiftUI

struct EpisodeDetailedView: View {
    var viewModel: EpisodeViewModel
    var episode: Episode
    
    let elementHeight = 250.0
    let columns = [GridItem(.flexible(), spacing: 16), GridItem(.flexible())]
    
    var body: some View {
        ScrollView {
            VStack {
                Text(episode.name)
                    .font(.system(size: 24, weight: .semibold))
                VStack {
                    CustomInfoView(leadingText: "Episode:", trailingText: episode.episode)
                    CustomInfoView(leadingText: "Aired:", trailingText: episode.air_date)
                }
                .padding(.horizontal, 16)
                
                if !episode.characters.isEmpty {
                    Text("Characters in this episode:")
                        .font(.system(size: 20, weight: .semibold))
                        .padding(EdgeInsets(top: 40, leading: 16, bottom: 4, trailing: 16))
                    LazyVGrid(
                        columns: columns,
                        spacing: 20,
                        content: {
                            EpisodeCharactersView(episode: episode, viewModel: viewModel)
                        })
                    .padding(16)
                }
            }
        }
    }
}

struct EpisodeCharactersView: View {
    var episode: Episode
    var viewModel: EpisodeViewModel
    @State private var characters: [String: Character] = [:]
    
    var body: some View {
        ForEach(episode.characters, id: \.self) { characterURL in
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
