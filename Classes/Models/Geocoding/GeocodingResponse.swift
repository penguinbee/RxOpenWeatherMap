//
//  GeocodingResponse.swift
//  WeatherApp-MVVMC
//
//  Created by Greener Chen on 2021/2/26.
//

import Foundation

struct GeocodingResponse {
    var rawValue: [Location]
}

extension GeocodingResponse: Decodable {
    init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        rawValue = try container.decode([Location].self)
    }
}

extension GeocodingResponse {
    init(data: Data, using decoder: JSONDecoder = .init()) throws {
        self = try decoder.decode(GeocodingResponse.self, from: data)
    }
}
