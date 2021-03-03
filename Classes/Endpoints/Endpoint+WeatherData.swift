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
    
    var resource: String {
        weatherDataURL
    }
    
    var endpoint: String {
        var path = ""
        switch self {
        case .oneCall(latitude: _, longitude: _, excludes: _):
            path = "onecall"
        }
        return path
    }
    
    var queryItems: [String : Any]? {
        let builder = QueryItemsBuillder()
            .addItem(key: "appId", value: ClientInfo.shared.appId)
            .addItem(key: "units", value: ClientInfo.shared.units)
            .addItem(key: "lang", value: ClientInfo.shared.language)
        
        switch self {
        case let .oneCall(latitude, longitude, excludes):
            builder
                .addItem(key: "lat", value: latitude)
                .addItem(key: "lon", value: longitude)
                .addItem(key: "exclude",
                         value: excludes
                            .map { $0.rawValue }
                            .joined(separator: ","))
        }
        
        return builder.items
    }
}

public enum WeatherDataType: String {
    case current
    case minutely
    case hourly
    case daily
    case alerts
}
