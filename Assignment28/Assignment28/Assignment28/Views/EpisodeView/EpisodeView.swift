//
//  EpisodeView.swift
//  Assignment28
//
//  Created by Akaki Titberidze on 31.05.24.
//

import SwiftUI

struct EpisodeView: View {
    @ObservedObject var viewModel: EpisodeViewModel
    let columns = [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16),  GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid( columns: columns,
                           spacing: 20,
                           content: {
                    ForEach(viewModel.getEpisodesData(), id: \.self) { episode in
                        ZStack {
                            NavigationLink(destination: EpisodeDetailedView(viewModel: viewModel, episode: episode)) {
                                CustomEpisodeCell(name: episode.episode)
                            }
                            .buttonStyle(PlainButtonStyle())
                            .listRowBackground(Color.clear)
                            .onAppear {
                                viewModel.loadMoreEpisodes(currentItem: episode)
                            }
                        }
                    }
                })
                .padding(16)
                .navigationTitle("Episodes")
                .navigationDestination(for: Episode.self) { episode in
                    EpisodeDetailedView(viewModel: viewModel, episode: episode)
                }
            }
        }
    }
}

#Preview {
    EpisodeView(viewModel: EpisodeViewModel())
}
