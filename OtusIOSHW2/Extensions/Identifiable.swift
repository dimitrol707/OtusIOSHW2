//
//  Identifiable.swift
//  OtusIOSHW2
//
//  Created by Дмитрий Мальцев on 26.06.2022.
//

import Foundation
import NetworkLayer

extension Anime: Identifiable {
    public var id: Int? { malId }
}

extension AnimeCharactersDataInner: Identifiable {
    public var id: Int? { character?.malId }
}

extension Genre: Identifiable {
    public var id: Int? { malId }
}


