//
//  Location.swift
//  WeatherApp-MVVMC
//
//  Created by Greener Chen on 2021/2/26.
//

import Foundation

struct Location {
    let name: String
    var localName: String?
    var asciiName: String
    var featureName: String
    let latitude: Double
    let longitude: Double
    let country: String
    let state: String?
    
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
                return nil
            }
        }
        
        var intValue: Int?
        init?(intValue: Int) {
            return nil
        }
    }
}

extension Location: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        latitude = try container.decode(Double.self, forKey: .latitude)
        longitude = try container.decode(Double.self, forKey: .longitude)
        country = try container.decode(String.self, forKey: .country)
        state = try container.decodeIfPresent(String.self, forKey: .state)
        
        let localNamesContainer = try container.nestedContainer(keyedBy: LocalNamesCodingKeys.self, forKey: .localNames)
        asciiName = try localNamesContainer.decode(String.self, forKey: LocalNamesCodingKeys(stringValue: "ascii")!)
        featureName = try localNamesContainer.decode(String.self, forKey: LocalNamesCodingKeys(stringValue: "feature_name")!)
        
        guard let langCode = Locale.current.languageCode?.lowercased() else { return }
        localName = try localNamesContainer.decodeIfPresent(String.self, forKey: LocalNamesCodingKeys(stringValue: langCode)!)
    }
}

extension Location: Equatable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.name == rhs.name &&
            lhs.latitude == rhs.latitude &&
            lhs.longitude == rhs.longitude &&
            lhs.country == rhs.country &&
            lhs.state == rhs.state &&
            lhs.localName == rhs.localName
    }
}
