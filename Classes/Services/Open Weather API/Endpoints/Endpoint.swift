//
//  Endpoint.swift
//  WeatherApp-MVVMC
//
//  Created by Greener Chen on 2021/2/25.
//

import Foundation
import Alamofire

protocol Endpoint: URLConvertible {
    var path: String { get }
    var httpMethod: Alamofire.HTTPMethod { get }
    var queryItems: [String:Any]? { get }
}

// MARK: - Properties
extension Endpoint {
    var httpMethod: Alamofire.HTTPMethod {
        .get
    }
}

// MARK: - Helpers
extension Endpoint {
    func createBasicQueryItems() -> [String:Any]  {
        var items: [String:Any]  = [:]
        items["appId"] = OpenWeatherClient.shared.openWeatherAPIKey
        items["units"] = OpenWeatherClient.shared.temperatureUnit.rawValue
        items["lang"] = OpenWeatherClient.shared.languageCode
        return items
    }
}

extension Dictionary where Key == String, Value == Any {
    func toURLQueryItems() -> [URLQueryItem] {
        var items: [URLQueryItem] = []
        for (name, value) in self {
            let item = URLQueryItem(name: name, value: (value as! String))
            items.append(item)
        }
        return items
    }
}

enum EndpointError: Error {
    case urlConversionError
}
