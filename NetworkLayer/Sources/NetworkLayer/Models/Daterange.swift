//
// Daterange.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

/** Date range */
public struct Daterange: Codable, JSONEncodable, Hashable {

    /** Date ISO8601 */
    public var from: String?
    /** Date ISO8601 */
    public var to: String?
    public var prop: DaterangeProp?

    public init(from: String? = nil, to: String? = nil, prop: DaterangeProp? = nil) {
        self.from = from
        self.to = to
        self.prop = prop
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case from
        case to
        case prop
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(from, forKey: .from)
        try container.encodeIfPresent(to, forKey: .to)
        try container.encodeIfPresent(prop, forKey: .prop)
    }
}
