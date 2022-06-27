//
//  AnimeItemViewModel.swift
//  OtusIOSHW2
//
//  Created by Дмитрий Мальцев on 26.06.2022.
//

import SwiftUI
import NetworkLayer

class AnimeItemViewModel: ObservableObject {
    @Published var animeCharacters: [AnimeCharactersDataInner] = .init()
    
    func fetchCharacters(anime: Anime) {
        NetworkLayer.AnimeAPI.getAnimeCharacters(id: anime.malId!, completion: {
            [weak self] data, error in
            guard let self = self,
                  let characters = data?.data,
                  !characters.isEmpty else { return }
            self.animeCharacters = characters
        })
    }
}
