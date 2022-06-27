//
// CharacterAnimeDataInner.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct CharacterAnimeDataInner: Codable, JSONEncodable, Hashable {

    /** Character's Role */
    public var role: String?
    public var anime: AnimeMeta?

    public init(role: String? = nil, anime: AnimeMeta? = nil) {
        self.role = role
        self.anime = anime
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case role
        case anime
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(role, forKey: .role)
        try container.encodeIfPresent(anime, forKey: .anime)
    }
}

