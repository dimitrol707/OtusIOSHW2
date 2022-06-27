//
// Genre.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

/** Genre Resource */
public struct Genre: Codable, JSONEncodable, Hashable {

    /** MyAnimeList ID */
    public var malId: Int?
    /** Genre Name */
    public var name: String?
    /** MyAnimeList URL */
    public var url: String?
    /** Genre's entry count */
    public var count: Int?

    public init(malId: Int? = nil, name: String? = nil, url: String? = nil, count: Int? = nil) {
        self.malId = malId
        self.name = name
        self.url = url
        self.count = count
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case malId = "mal_id"
        case name
        case url
        case count
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(malId, forKey: .malId)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(url, forKey: .url)
        try container.encodeIfPresent(count, forKey: .count)
    }
}
