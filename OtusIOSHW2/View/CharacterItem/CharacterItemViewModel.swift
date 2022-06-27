//
//  CharacterItemViewModel.swift
//  OtusIOSHW2
//
//  Created by Дмитрий Мальцев on 27.06.2022.
//

import SwiftUI
import NetworkLayer

class CharacterItemViewModel: ObservableObject {
    @Published var character: ModelCharacter?
    
    private var idCharacter: Int?
    
    init(idCharacter: Int?) {
        self.idCharacter = idCharacter
    }
    
    func fetchCharacter() {
        NetworkLayer.CharactersAPI.getCharacterById(id: self.idCharacter!, completion: {
            [weak self] data, error in
            guard let self = self,
                  let character = data?.data else { return }
            self.character = character
        })
    }
}
