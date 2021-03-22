//
//  DailyForecast.swift
//  WeatherApp-MVVMC
//
//  Created by Greener Chen on 2021/2/26.
//

import Foundation

public struct DailyForecast: Codable {
    public let dt: TimeInterval
    public let weather: [Weather]
    public let clouds: Int
    public let windSpeed: Float
    public let windDegree: Float
    public let pop: Float   // Probability of precipitation
    public let sunrise: TimeInterval
    public let sunset: TimeInterval
    public let temperature: ForecastTemparature
    public let feelsLike: FeelsLikeTemparature
    public let pressure: Float
    public let humidity: Int
    public let dewPoint: Float
    public let uvi: Float
    public let rain: Float?
    public let snow: Float?
    
    enum CodingKeys: String, CodingKey {
        case dt
        case weather
        case clouds
        case windSpeed = "wind_speed"
        case windDegree = "wind_deg"
        case pop
        case sunrise
        case sunset
        case temperature = "temp"
        case feelsLike = "feels_like"
        case pressure
        case humidity
        case dewPoint = "dew_point"
        case uvi
        case rain
        case snow
    }
}
