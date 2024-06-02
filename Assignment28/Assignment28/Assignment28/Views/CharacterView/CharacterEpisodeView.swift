//
//  CharacterEpisodeView.swift
//  Assignment28
//
//  Created by Akaki Titberidze on 31.05.24.
//

import SwiftUI

struct CustomEpisodeView: View {
    @ObservedObject var viewModel: CharacterViewModel
    var episodeUrl: String
    @State private var episode: Episode?
    @State private var isOpen = false
    
    var body: some View {
        VStack(alignment: .leading) {
            if let episode = episode {
                CustomEpisodeDetailsView(episodeShortName: episode.episode,airDate: episode.air_date,episodeLongName: episode.name)
                if isOpen {
                    Text("Characters in the episode:")
                        .font(.system(size: 17, weight: .bold))
                        .padding(.top, 8)
                        .transition(.move(edge: .bottom))
                    CustomEpisodeCharactersView(viewModel: viewModel, episode: episode)
                        .transition(.move(edge: .bottom))
                }
            } else {
                ProgressView()
                    .onAppear {
                        viewModel.fetchEpisodeData(url: episodeUrl) { fetchedEpisode in
                            self.episode = fetchedEpisode
                        }
                    }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(10)
        .background(.customGray)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .onAppear {
            viewModel.fetchEpisodeData(url: episodeUrl) { fetchedEpisode in
                self.episode = fetchedEpisode
            }
        }
        .onTapGesture {
            withAnimation {
                isOpen.toggle()
            }
        }
    }
}

private struct CustomEpisodeDetailsView: View {
    var episodeShortName: String
    var airDate: String
    var episodeLongName: String
    
    var body: some View {
        HStack(alignment: .top) {
            Text(episodeShortName)
                .font(.system(size: 17, weight: .bold))
                .lineLimit(1)
            Spacer()
            Text(airDate)
                .font(.system(size: 14, weight: .light))
                .lineLimit(1)
        }
        Text(episodeLongName)
            .font(.system(size: 14, weight: .light))
            .padding(.top, 2)
    }
}
import SwiftUI

private struct CustomEpisodeCharactersView: View {
    @ObservedObject var viewModel: CharacterViewModel
    var episode: Episode
    @State private var characterNames: [String: String] = [:]
    let rows = [GridItem(.flexible(), spacing: 4), GridItem(.flexible(), spacing: 4), GridItem(.flexible())]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows, spacing: 20) {
                ForEach(episode.characters, id: \.self) { characterUrl in
                    if let name = characterNames[characterUrl] {
                        Text(name)
                            .font(.system(size: 14, weight: .regular))
                    } else {
                        ProgressView()
                            .onAppear {
                                viewModel.fetchCharacterData(url: characterUrl) { fetchedCharacter in
                                    if let fetchedCharacter = fetchedCharacter {
                                        characterNames[characterUrl] = fetchedCharacter.name
                                    }
                                }
                            }
                    }
                }
                .padding(.bottom, 4)
            }
            .transition(.slide)
        }
    }
}

