//
//  AnimeListViewModel.swift
//  OtusIOSHW2
//
//  Created by Дмитрий Мальцев on 26.06.2022.
//

import SwiftUI
import Combine
import NetworkLayer

class AnimeListViewModel: ObservableObject {
    @Published var animes: [Anime] = .init()
    @Published var animeGenres: [Genre] = .init()
    @Published var selectedGenre: Genre?
    
    @Published var isLoading: Bool = false
    @Published var pageAnimeList: Int = 1
    @Published var isLastPage: Bool = false
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubsribers()
    }
    
    func addSubsribers() {
        $animeGenres
            .sink { [weak self] genres in
                guard let self = self,
                      !genres.isEmpty else { return }
                if self.selectedGenre == nil {
                    self.selectedGenre = genres[0]
                }
            }
            .store(in: &cancellables)
        $selectedGenre
            .sink { [weak self] genre in
                guard let self = self,
                      let genre = genre else { return }
                self.animes = []
                self.pageAnimeList = 1
                self.isLastPage = false
                self.fetchAnimes(page: self.pageAnimeList, genre: genre)
            }
            .store(in: &cancellables)
    }
    
    func fetchGenres() {
        NetworkLayer.GenresAPI.getAnimeGenres {
            [weak self] data, error in
            guard let self = self,
                  let genres = data?.data,
                  !genres.isEmpty else { return }
            self.animeGenres = genres
        }
    }
    
    func fetchAnimes(page: Int, genre: Genre) {
        NetworkLayer.AnimeAPI.getAnimeSearch(page: page, genres: String(genre.malId!)) {
            [weak self] data, error in
            guard let self = self,
                  let animes = data?.data else { return }
            
            self.isLoading = false
            
            if animes.isEmpty {
                self.isLastPage = true
            } else {
                self.isLastPage = animes.count % 25 != 0
            }
            
            if self.pageAnimeList == 1 {
                self.animes = animes
            } else {
                self.animes.append(contentsOf: animes)
            }
            
        }
    }
    
    public func fetchNextPage() {
        guard isLoading, isLastPage == false else { return }
        pageAnimeList += 1
        fetchAnimes(page: pageAnimeList, genre: selectedGenre!)
    }
}
