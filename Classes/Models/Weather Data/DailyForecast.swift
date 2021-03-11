//
//  DailyForecast.swift
//  WeatherApp-MVVMC
//
//  Created by Greener Chen on 2021/2/26.
//

import Foundation

public struct DailyForecast {
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
    public let rain: Rain?
    public let snow: Snow?
    
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

extension DailyForecast: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        dt = try container.decode(TimeInterval.self, forKey: .dt)
        weather = try container.decode([Weather].self, forKey: .weather)
        clouds = try container.decode(Int.self, forKey: .clouds)
        windSpeed = try container.decode(Float.self, forKey: .windSpeed)
        windDegree = try container.decode(Float.self, forKey: .windDegree)
        pop = try container.decode(Float.self, forKey: .pop)
        sunrise = try container.decode(TimeInterval.self, forKey: .sunrise)
        sunset = try container.decode(TimeInterval.self, forKey: .sunset)
        temperature = try container.decode(ForecastTemparature.self, forKey: .temperature)
        feelsLike = try container.decode(FeelsLikeTemparature.self, forKey: .feelsLike)
        pressure = try container.decode(Float.self, forKey: .pressure)
        humidity = try container.decode(Int.self, forKey: .humidity)
        dewPoint = try container.decode(Float.self, forKey: .dewPoint)
        uvi = try container.decode(Float.self, forKey: .uvi)
        rain = try container.decodeIfPresent(Rain.self, forKey: .rain)
        snow = try container.decodeIfPresent(Snow.self, forKey: .snow)
    }
}
