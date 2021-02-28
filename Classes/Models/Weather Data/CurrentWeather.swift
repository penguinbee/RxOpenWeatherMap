//
//  CurrentWeather.swift
//  WeatherApp-MVVMC
//
//  Created by Greener Chen on 2021/2/26.
//

import Foundation

public struct CurrentWeather {
    public let dt: TimeInterval
    public let sunrise: TimeInterval
    public let sunset: TimeInterval
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
    public let windGust: Int?
    public let rain: Rain?
    public let snow: Snow?
    public let weather: [Weather]
    
    enum CodingKeys: String, CodingKey {
        case dt
        case sunrise
        case sunset
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
        case windGust = "wind_gust"
        case rain
        case snow
        case weather
    }
}

extension CurrentWeather: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        dt = try container.decode(TimeInterval.self, forKey: .dt)
        sunrise = try container.decode(TimeInterval.self, forKey: .sunrise)
        sunset = try container.decode(TimeInterval.self, forKey: .sunset)
        temparature = try container.decode(Float.self, forKey: .temparature)
        feelsLike = try container.decode(Float.self, forKey: .feelsLike)
        pressure = try container.decode(Int.self, forKey: .pressure)
        humidity = try container.decode(Int.self, forKey: .humidity)
        dewPoint = try container.decode(Float.self, forKey: .dewPoint)
        uvi = try container.decode(Float.self, forKey: .uvi)
        clouds = try container.decode(Int.self, forKey: .clouds)
        visibility = try container.decode(Int.self, forKey: .visibility)
        windSpeed = try container.decode(Float.self, forKey: .windSpeed)
        windDegree = try container.decode(Int.self, forKey: .windDegree)
        windGust = try container.decodeIfPresent(Int.self, forKey: .windGust)
        rain = try container.decodeIfPresent(Rain.self, forKey: .rain)
        snow = try container.decodeIfPresent(Snow.self, forKey: .snow)
        weather = try container.decode([Weather].self, forKey: .weather)
    }
}
