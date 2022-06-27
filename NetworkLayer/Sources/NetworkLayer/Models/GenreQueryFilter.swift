//
// GenreQueryFilter.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

/** Filter genres by type */
public enum GenreQueryFilter: String, Codable, CaseIterable {
    case genres = "genres"
    case explicitGenres = "explicit_genres"
    case themes = "themes"
    case demographics = "demographics"
}