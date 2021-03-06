//
// CharacterImages.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct CharacterImages: Codable, JSONEncodable, Hashable {

    public var jpg: CharacterImagesJpg?
    public var webp: CharacterImagesWebp?

    public init(jpg: CharacterImagesJpg? = nil, webp: CharacterImagesWebp? = nil) {
        self.jpg = jpg
        self.webp = webp
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case jpg
        case webp
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(jpg, forKey: .jpg)
        try container.encodeIfPresent(webp, forKey: .webp)
    }
}

