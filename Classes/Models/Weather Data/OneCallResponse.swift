//
//  OneCallResponse.swift
//  WeatherApp-MVVMC
//
//  Created by Greener Chen on 2021/2/25.
//

import Foundation

public struct OneCallResponse: Codable {
    public let latitude: Double
    public let longitude: Double
    public let timezone: String
    public let timezoneOffset: TimeInterval
    public let current: CurrentWeather
    public let hourly: [HourlyForecast]
    public let daily: [DailyForecast]
    
    enum CodingKeys: String, CodingKey {
        case latitude = "lat"
        case longitude = "lon"
        case timezone
        case timezoneOffset = "timezone_offset"
        case current
        case hourly
        case daily
    }
}

extension OneCallResponse {
    public init(data: Data, using decoder: JSONDecoder = .init()) throws {
        self = try decoder.decode(OneCallResponse.self, from: data)
    }
}
