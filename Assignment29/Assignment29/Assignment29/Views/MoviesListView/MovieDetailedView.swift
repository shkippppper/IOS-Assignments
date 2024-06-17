//
//  MovieDetailedView.swift
//  Assignment29
//
//  Created by Akaki Titberidze on 07.06.24.
//

import SwiftUI
import SwiftData

struct MovieDetailedView: View {
    var movie: Movie
    var genres: String
    var runtime: Int
    @State var isFavorite: Bool
    var didClickFavourite: () -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            
            topView(movie: movie)
            
            middleView(movie: movie, genres: genres, runtime: runtime)
            
            VStack {
                HStack {
                    
                    Text("About Movie")
                        .font(.system(size: 14, weight: .semibold))
                        .padding(EdgeInsets(top: 0, leading: 4, bottom: 10, trailing: 0))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundStyle(.customDefaultPrimary)
                    Button(action: {
                        didClickFavourite()
                        isFavorite.toggle()
                    }) {
                        Image(systemName: isFavorite ? "heart.fill" : "heart")
                            .foregroundColor(isFavorite ? .red : .gray)
                    }
                }
                Rectangle()
                    .fill(.customGrayLight)
                    .frame(maxWidth: .infinity, maxHeight: 4)
            }
            .padding(24)
            
            Text(movie.overview ?? "")
                .font(.system(size: 12))
                .padding(EdgeInsets(top: 0, leading: 29, bottom: 0, trailing: 29))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(.customDefaultPrimary)
            Spacer()
            
            
        }
        .ignoresSafeArea()
        .background(.customBackground)
        .navigationBarTitle(Text("\(movie.title ?? "Title")"), displayMode: .inline)
    }
    
    func topView(movie: Movie) -> some View {
        return ZStack {
            CustomImageView(
                imageUrl: "\(Constants.imageURL)\(movie.backdrop_path ?? "")",
                imageHeight: 210,
                cornerRadius: 16,
                onlyBottomRadius: true
            )
            VStack(alignment: .trailing) {
                HStack(spacing: 0) {
                    Spacer()
                    HStack(spacing: 4) {
                        Image("iconStarOrange")
                            .resizable()
                            .frame(width: 16, height: 16)
                        Text(String(format: "%.1f", movie.vote_average ?? 0))
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundStyle(.customOrange)
                    }
                    .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
                    .background(.ultraThinMaterial, in:
                                    RoundedRectangle(cornerRadius: 8))
                }
            }
            .padding(EdgeInsets(top: 170, leading: 0, bottom: 0, trailing: 12))
            
            HStack(spacing: 12) {
                CustomImageView(
                    imageUrl: "\(Constants.imageURL)\(movie.poster_path ?? "")",
                    imageHeight: 120,
                    imageWidth: 95,
                    cornerRadius: 16
                )
                Text(movie.title ?? "")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(.customDefaultPrimary)
                    .lineLimit(2)
                    .frame(height: 50, alignment: .topLeading)
                    .padding(.top, 74)
                Spacer()
                
            }
            .padding(EdgeInsets(top: 200, leading: 30, bottom: 0, trailing: 6))
        }
        .padding(.top, 50)
    }
    
    func middleView(movie: Movie, genres: String, runtime: Int) -> some View {
        
        return HStack(spacing: 12) {
            HStack(spacing: 4) {
                Image("iconCalendar")
                    .resizable()
                    .frame(width: 16, height: 16)
                Text(movie.release_date?.prefix(4) ?? "")
                    .font(.system(size: 12))
                    .foregroundStyle(.customGray)
            }
            Rectangle()
                .fill(.customDarkGray)
                .frame(width: 1, height: 16)
            HStack(spacing: 4) {
                Image("iconClock")
                    .resizable()
                    .frame(width: 16, height: 16)
                Text("\(runtime)")
                    .font(.system(size: 12))
                    .foregroundStyle(.customGray)
            }
            Rectangle()
                .fill(.customDarkGray)
                .frame(width: 1, height: 16)
            HStack(spacing: 4) {
                Image("iconTicket")
                    .resizable()
                    .frame(width: 16, height: 16)
                Text(genres)
                    .font(.system(size: 12))
                    .foregroundStyle(.customGray)
            }
        }
        .padding(EdgeInsets(top: 16, leading: 16, bottom: 8, trailing: 16))
    }
}

