//
// PeopleImages.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct PeopleImages: Codable, JSONEncodable, Hashable {

    public var jpg: PeopleImagesJpg?

    public init(jpg: PeopleImagesJpg? = nil) {
        self.jpg = jpg
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case jpg
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(jpg, forKey: .jpg)
    }
}

