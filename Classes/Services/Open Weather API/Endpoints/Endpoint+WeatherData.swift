//
//  Endpoint+WeatherData.swift
//  WeatherApp-MVVMC
//
//  Created by Greener Chen on 2021/2/26.
//

import Foundation

let weatherDataURL = "http://api.openweathermap.org/data/2.5/"

enum WeatherDataEndpoint {
    /// get current weather, hourly and daily forecast
    case oneCall(latitude: Double, longitude: Double, excludes: [WeatherDataType] = [.minutely, .alerts])
}

extension WeatherDataEndpoint: Endpoint {
    var path: String {
        var path = ""
        switch self {
        case .oneCall(latitude: _, longitude: _, excludes: _):
            path = "onecall"
        }
        return path
    }
    
    func asURL() throws -> URL {
        var urlComponents = URLComponents(string: weatherDataURL + path)
        urlComponents?.queryItems = queryItems?.toURLQueryItems()
        guard let url = urlComponents?.url else { throw EndpointError.urlConversionError }
        return url
    }
    
    var queryItems: [String : Any]? {
        var items = createBasicQueryItems()
        
        switch self {
        case let .oneCall(latitude, longitude, excludes):
            items["lat"] = String(latitude)
            items["lon"] = String(longitude)
            items["exclude"] = excludes
                .map { $0.rawValue }
                .joined(separator: ",")
        }
        return items
    }
}

enum WeatherDataType: String {
    case current
    case minutely
    case hourly
    case daily
    case alerts
}
