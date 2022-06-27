//
// DaterangeProp.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

/** Date Prop */
public struct DaterangeProp: Codable, JSONEncodable, Hashable {

    public var from: DaterangePropFrom?
    public var to: DaterangePropTo?
    /** Raw parsed string */
    public var string: String?

    public init(from: DaterangePropFrom? = nil, to: DaterangePropTo? = nil, string: String? = nil) {
        self.from = from
        self.to = to
        self.string = string
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case from
        case to
        case string
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(from, forKey: .from)
        try container.encodeIfPresent(to, forKey: .to)
        try container.encodeIfPresent(string, forKey: .string)
    }
}

