//
//  CurrentWeather.swift
//  WeatherApp-MVVMC
//
//  Created by Greener Chen on 2021/2/26.
//

import Foundation

struct CurrentWeather {
    let dt: TimeInterval
    let sunrise: TimeInterval
    let sunset: TimeInterval
    let temparature: Float
    let feelsLike: Float
    let pressure: Int
    let humidity: Int
    let dewPoint: Float
    let uvi: Float
    let clouds: Int
    let visibility: Int
    let windSpeed: Float
    let windDegree: Int
    let windGust: Int?
    let rain: Rain?
    let snow: Snow?
    let weather: [Weather]
    
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
    init(from decoder: Decoder) throws {
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
