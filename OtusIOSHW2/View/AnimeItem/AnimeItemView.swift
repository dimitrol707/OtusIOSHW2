//
//  AnimeItemView.swift
//  OtusIOSHW2
//
//  Created by Дмитрий Мальцев on 26.06.2022.
//

import SwiftUI
import NetworkLayer
import NavigationStack

struct AnimeItemView: View {
    @EnvironmentObject private var navStackVM: NavigationStackViewModel
    @ObservedObject var animeItemVM: AnimeItemViewModel = .init()
    var anime: Anime
    
    var body: some View {
        VStack(spacing: 0) {
            Group {
                HStack {
                    Button {
                        DispatchQueue.main.async {
                            navStackVM.pop()
                        }
                    } label: {
                        Image(systemName: "arrow.left")
                            .font(.title2)
                    }
                    .padding(10)
                    Spacer()
                }
            }
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 10) {
                    Text(anime.title ?? "")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    HStack(alignment: .top) {
                        ImageView(imageUrl: anime.images?.jpg?.imageUrl ?? "")
                            .scaledToFit()
                            .frame(width: 170)
                            .cornerRadius(15)
                        Spacer()
                        VStack(alignment: .leading, spacing: 0) {
                            type
                            episodes
                            producers
                            Spacer()
                            score
                            
                            Text("Members: \(anime.members ?? 0)")
                                .font(.caption)
                                .foregroundColor(Color(UIColor.systemGray2))
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .frame(maxWidth: .infinity)
                    genres
                    Text(anime.synopsis ?? "")
                    Divider()
                    Text("Characters: ")
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    characters
                }
                .padding()
            }
            .padding(.bottom, 60)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

extension AnimeItemView {
    var type: some View {
        HStack {
            Text("Type:")
                .font(.callout)
                .foregroundColor(.gray)
            Text("\(anime.type?.rawValue ?? "unknown type")")
                .font(.title3)
                .foregroundColor(.black)
        }
    }
    var episodes: some View {
        Group {
            HStack {
                Text("Episodes:")
                    .font(.callout)
                    .foregroundColor(.gray)
                Text("\(anime.episodes != nil ? String(describing: anime.episodes!) : "1...")")
                    .font(.title3)
                    .foregroundColor(.black)
            }
        }
    }
    var producers: some View {
        Group {
            VStack(alignment: .leading, spacing: 0) {
                Text("Producers:")
                    .font(.callout)
                    .foregroundColor(.gray)
                TagView(tags: anime.producers?.compactMap({ producer in
                    producer.name
                }) ?? [])
            }
        }
    }
    var genres: some View {
        TagView(tags: anime.genres?.compactMap({ genre in
            genre.name
        }) ?? [])
    }
    var score: some View {
        HStack(spacing: 5) {
            Image(systemName: "star.fill")
                .foregroundColor(.yellow)
            Text(anime.score != nil ? String(format: "%.2f" , anime.score!) : "0.00")
                .foregroundColor(.black)
        }
        .font(Font.system(size: 30))
    }
    var characters: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 5) {
                ForEach(animeItemVM.animeCharacters) {
                    characterData in
                    ImageView(imageUrl: characterData.character?.images?.jpg?.imageUrl ?? "")
                        .modifier(CharacterImage(characterData: characterData))
                        .onTapGesture {
                            navStackVM.push(CharacterItemView(idCharacter: characterData.character?.malId))
                        }
                }
            }
        }
        .onAppear {
            animeItemVM.fetchCharacters(anime: anime)
        }
    }
}

private struct CharacterImage: ViewModifier {
    var characterData: AnimeCharactersDataInner
    
    func body(content: Content) -> some View {
        content
            .scaledToFill()
            .frame(width: 120, height: 170)
            .overlay(
                VStack {
                    Text(characterData.character?.name ?? "")
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal ,5)
                        .foregroundColor(.black)
                }
                .frame(maxWidth: .infinity, minHeight: 60)
                .background(.ultraThinMaterial)
                , alignment: .bottom
            )
            .cornerRadius(5)
    }
}
