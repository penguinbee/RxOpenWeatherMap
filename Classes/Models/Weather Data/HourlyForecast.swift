//
//  Forecast.swift
//  WeatherApp-MVVMC
//
//  Created by Greener Chen on 2021/2/26.
//

import Foundation

public struct HourlyForecast: Codable {
    public let dt: TimeInterval
    public let temparature: Float
    public let feelsLike: Float
    public let pressure: Int
    public let humidity: Int
    public let dewPoint: Float
    public let uvi: Float
    public let clouds: Int
    public let visibility: Int
    public let windSpeed: Float
    public let windDegree: Int
    public let weather: [Weather]
    public let pop: Float   // Probability of precipitation
    public let rain: Rain?
    public let snow: Snow?
    
    enum CodingKeys: String, CodingKey {
        case dt
        case temparature = "temp"
        case feelsLike = "feels_like"
        case pressure
        case humidity
        case dewPoint = "dew_point"
        case uvi
        case clouds
        case visibility
        case windSpeed = "wind_speed"
        case windDegree = "wind_deg"
        case weather
        case pop
        case rain
        case snow
    }
}
