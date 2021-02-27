//
//  DailyForecast.swift
//  WeatherApp-MVVMC
//
//  Created by Greener Chen on 2021/2/26.
//

import Foundation

struct DailyForecast {
    let dt: TimeInterval
    let weather: [Weather]
    let clouds: Int
    let windSpeed: Float
    let windDegree: Float
    let pop: Float   // Probability of precipitation
    let sunrise: TimeInterval
    let sunset: TimeInterval
    let temperature: ForecastTemparature
    let feelsLike: FeelsLikeTemparature
    let pressure: Float
    let humidity: Int
    let dewPoint: Float
    let uvi: Float
    
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
    }
}

extension DailyForecast: Decodable {
    init(from decoder: Decoder) throws {
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
        
    }
}
