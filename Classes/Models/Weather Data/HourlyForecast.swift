//
//  Forecast.swift
//  WeatherApp-MVVMC
//
//  Created by Greener Chen on 2021/2/26.
//

import Foundation

struct HourlyForecast {
    let dt: TimeInterval
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
    let weather: [Weather]
    let pop: Float   // Probability of precipitation
    
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
    init(from decoder: Decoder) throws {
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
