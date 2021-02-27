//
//  Endpoint+Geocoding.swift
//  WeatherApp-MVVMC
//
//  Created by Greener Chen on 2021/2/26.
//

import Foundation

let geocodingURL = "http://api.openweathermap.org/geo/1.0/"

enum GeocodingEndpoint {
    /// get geo coordinates by location name
    case directGeocoding(location: String, limit: Int = 10)
}

extension GeocodingEndpoint: Endpoint {
    var path: String {
        var path = ""
        switch self {
        case .directGeocoding(_, _):
            path = "direct"
        }
        return path
    }
    
    func asURL() throws -> URL {
        var urlComponents = URLComponents(string: geocodingURL + path)
        urlComponents?.queryItems = queryItems?.toURLQueryItems()
        guard let url = urlComponents?.url else { throw EndpointError.urlConversionError }
        return url
    }
    
    var queryItems: [String : Any]? {
        var items = createBasicQueryItems()
        
        switch self {
        case let .directGeocoding(location, limit):
            items["q"] = String(location)
            items["limit"] = String(limit)
        }
        return items
    }
}
