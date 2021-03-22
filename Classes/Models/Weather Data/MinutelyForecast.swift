//
//  MinutelyForecast.swift
//  OpenWeatherNetworking
//
//  Created by Greener Chen on 2021/2/28.
//

import Foundation

public struct MinutelyForecast: Codable {
    public let dt: TimeInterval
    public let precipitation: Int
    
    enum CodingKeys: String, CodingKey {
        case dt
        case precipitation
    }
}
