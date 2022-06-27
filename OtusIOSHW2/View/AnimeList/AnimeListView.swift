//
//  AnimeListView.swift
//  OtusIOSHW2
//
//  Created by Дмитрий Мальцев on 26.06.2022.
//

import SwiftUI
import NetworkLayer
import NavigationStack

struct AnimeListView: View {
    @EnvironmentObject private var navStackVM: NavigationStackViewModel
    @ObservedObject var animeListVM: AnimeListViewModel = .init()
    @Namespace var animGenreTab
    
    @GestureState var isDrag: Bool = false
    @State var offsetDrag: CGFloat = 0
    @State var selectDragRow: Anime? = nil
    
    var body: some View {
        VStack {
            genreAnimeList
                .onAppear {
                    animeListVM.fetchGenres()
                }
            if animeListVM.animes.isEmpty {
                VStack {
                    Spacer()
                    ProgressView()
                    Spacer()
                }
            } else {
                animeList
            }
        }
        .background(
            Color(UIColor.systemGray6)
        )
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct AnimeListView_Previews: PreviewProvider {
    static var previews: some View {
        AnimeListView(animeListVM: AnimeListViewModel())
    }
}

extension AnimeListView {
    var genreAnimeList: some View {
        ScrollViewReader {
            proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(animeListVM.animeGenres, id: \.self) {
                        genre in
                        VStack {
                            Text(genre.name!)
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundColor(animeListVM.selectedGenre == genre ? .black : Color(UIColor.systemGray3))
                                .padding(.bottom, 10)
                                .overlay(
                                    Group {
                                        if animeListVM.selectedGenre == genre {
                                            Capsule()
                                                .fill(Color.blue)
                                                .matchedGeometryEffect(id: "GENRETAB", in: animGenreTab)
                                                .frame(height: 3)
                                        } else {
                                            Capsule()
                                                .fill(Color.clear)
                                                .frame(height: 3)
                                        }
                                    }
                                    , alignment: .bottom
                                )
                        }
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                animeListVM.selectedGenre = genre
                                proxy.scrollTo(genre, anchor: .center)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .padding(.bottom, 10)
        }
    }
    var animeList: some View {
        GeometryReader {
            proxy in
            ScrollView(.vertical, showsIndicators: true) {
                VStack(spacing: 10) {
                    ForEach(animeListVM.animes) {
                        anime in
                        AnimeRowView(anime: anime)
                            .onTapGesture {
                                navStackVM.push(AnimeItemView(anime: anime))
                            }
                            .offset(x: selectDragRow?.id == anime.id ? offsetDrag : 0)
                            .gesture(
                                DragGesture()
                                    .updating($isDrag, body: { value, out, _ in
                                        DispatchQueue.main.async {
                                            if selectDragRow == nil {
                                                selectDragRow = anime
                                            }
                                        }
                                        out = true
                                    })
                                    .onChanged({ value in
                                        let translation = value.translation.width
                                        offsetDrag = (isDrag ? translation : .zero)
                                    })
                                    .onEnded({ value in
                                        withAnimation {
                                            offsetDrag = .zero
                                            selectDragRow = nil
                                        }
                                    })
                            )
                    }
                    Group {
                        if animeListVM.isLoading, animeListVM.isLastPage == false {
                            ProgressView()
                                .onAppear(perform: {
                                    animeListVM.fetchNextPage()
                                })
                        } else {
                            GeometryReader{
                                reader -> Color in
                                let minY = reader.frame(in: .global).minY
                                let height = UIScreen.main.bounds.height / 1.2
                                if !animeListVM.animes.isEmpty  && minY < height {
                                    DispatchQueue.main.async {
                                        animeListVM.isLoading = true
                                    }
                                }
                                
                                return Color.clear
                            }
                            .frame(width: 20, height: 20)
                        }
                    }
                }
                .padding(.horizontal, 10)
            }
            .padding(.bottom, 60)
            .frame(width: proxy.size.width, height: proxy.size.height)
            
        }
    }
}
