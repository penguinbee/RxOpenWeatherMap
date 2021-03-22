//
//  Location.swift
//  WeatherApp-MVVMC
//
//  Created by Greener Chen on 2021/2/26.
//

import Foundation

public struct Location {
    public let name: String
    public var localName: String?
    public var asciiName: String?
    public var featureName: String?
    public let latitude: Double
    public let longitude: Double
    public let country: String
    public let state: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case localNames = "local_names"
        case latitude = "lat"
        case longitude = "lon"
        case country
        case state
    }
    
    struct LocalNamesCodingKeys: CodingKey {
        var stringValue: String
        init?(stringValue: String) {
            switch stringValue {
            case "ascii", Locale.current.languageCode?.lowercased():
                self.stringValue = stringValue
            case "feature_name":
                self.stringValue = "feature_name"
            default:
                self.stringValue = stringValue
            }
        }
        
        var intValue: Int?
        init?(intValue: Int) {
            return nil
        }
    }
}

extension Location: Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(latitude, forKey: .latitude)
        try container.encode(longitude, forKey: .longitude)
        try container.encode(country, forKey: .country)
        try container.encode(state, forKey: .state)
        
        var localNamesContainer = container.nestedContainer(keyedBy: LocalNamesCodingKeys.self, forKey: .localNames)
        if let asciiName = asciiName {
            try localNamesContainer.encode(asciiName, forKey: LocalNamesCodingKeys(stringValue: "ascii")!)
        }
        if let featureName = featureName {
            try localNamesContainer.encode(featureName, forKey: LocalNamesCodingKeys(stringValue: "feature_name")!)
        }
        guard let langCode = Locale.current.languageCode?.lowercased() else { return }
        guard let localName = localName else { return }
        try localNamesContainer.encode(localName, forKey: LocalNamesCodingKeys(stringValue: langCode)!)
    }
}

extension Location: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        latitude = try container.decode(Double.self, forKey: .latitude)
        longitude = try container.decode(Double.self, forKey: .longitude)
        country = try container.decode(String.self, forKey: .country)
        state = try container.decodeIfPresent(String.self, forKey: .state)
        
        if container.contains(.localNames) {
            let localNamesContainer = try container.nestedContainer(keyedBy: LocalNamesCodingKeys.self, forKey: .localNames)
            asciiName = try localNamesContainer.decode(String.self, forKey: LocalNamesCodingKeys(stringValue: "ascii")!)
            featureName = try localNamesContainer.decode(String.self, forKey: LocalNamesCodingKeys(stringValue: "feature_name")!)
            
            guard let langCode = Locale.current.languageCode?.lowercased() else { return }
            localName = try localNamesContainer.decodeIfPresent(String.self, forKey: LocalNamesCodingKeys(stringValue: langCode)!)
        }
    }
}

extension Location: Equatable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.name == rhs.name &&
            lhs.latitude == rhs.latitude &&
            lhs.longitude == rhs.longitude &&
            lhs.country == rhs.country &&
            lhs.state == rhs.state &&
            lhs.localName == rhs.localName
    }
}
