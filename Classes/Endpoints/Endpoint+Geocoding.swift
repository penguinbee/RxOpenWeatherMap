//
//  Endpoint+Geocoding.swift
//  WeatherApp-MVVMC
//
//  Created by Greener Chen on 2021/2/26.
//

import Foundation
import RxAlamofire

let geocodingURL = "http://api.openweathermap.org/geo/1.0/"

enum GeocodingEndpoint {
    /// get geo coordinates by location name
    case directGeocoding(location: String, limit: Int = 10)
}

extension GeocodingEndpoint: Endpoint {
    
    var resource: String {
        geocodingURL
    }
    
    var endpoint: String {
        var path = ""
        switch self {
        case .directGeocoding(_, _):
            path = "direct"
        }
        return path
    }
    
    var queryItems: [String : Any]? {
        let builder = QueryItemsBuillder()
            .addItem(key: "appId", value: ClientInfo.shared.appId)
            .addItem(key: "units", value: ClientInfo.shared.units)
            .addItem(key: "lang", value: ClientInfo.shared.language)
        
        switch self {
        case let .directGeocoding(location, limit):
            builder
                .addItem(key: "q", value: location)
                .addItem(key: "limit", value: limit)
        }
        
        return builder.items
    }
}
