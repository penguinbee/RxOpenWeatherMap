//
//  Forecast.swift
//  WeatherApp-MVVMC
//
//  Created by Greener Chen on 2021/2/26.
//

import Foundation

public struct HourlyForecast {
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
    }
}

extension HourlyForecast: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        dt = try container.decode(TimeInterval.self, forKey: .dt)
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
        weather = try container.decode([Weather].self, forKey: .weather)
        pop = try container.decode(Float.self, forKey: .pop)
    }
}
