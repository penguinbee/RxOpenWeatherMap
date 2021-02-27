//
//  APIManager.swift
//  WeatherApp-MVVMC
//
//  Created by Greener Chen on 2021/2/26.
//

import Swinject

open class OpenWeatherClient {
    
    // MARK: - Singleton instance
    static let shared: OpenWeatherClient = OpenWeatherClient()
    
    // MARK: - Properties
    var openWeatherAPIKey = "PUT_YOUR_API_KEY_HERE"
    var temperatureUnit: TemperatureUnit = .celsius
    var languageCode: String? 
    
    // MARK: - APIs
    let container: Container = {
        let container = Container()
        container.register(WeatherApiClient.self) { _ in WeatherApiClient() }
        container.register(GeocodingApiClient.self) { _ in GeocodingApiClient() }
        return container
    }()
    lazy var weather: WeatherApiClient? = {
        container.resolve(WeatherApiClient.self)
    }()
    lazy var geocoding: GeocodingApiClient? = {
        container.resolve(GeocodingApiClient.self)
    }()
    
    // MARK: Public methods
    public func configure(apiKey: String,
                          temperatureUnit: TemperatureUnit = .celsius,
                          language: String?) {
        openWeatherAPIKey = apiKey
        self.temperatureUnit = temperatureUnit
        languageCode = language?.lowercased()
    }
}
