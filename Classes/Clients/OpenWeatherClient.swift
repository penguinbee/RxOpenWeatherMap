//
//  APIManager.swift
//  WeatherApp-MVVMC
//
//  Created by Greener Chen on 2021/2/26.
//

import Foundation

open class OpenWeatherClient {
    
    let clientInfo: ClientInfo = ClientInfo.shared
    
    // MARK: Initializer
    public init(apiKey: String,
                temperatureUnit: TemperatureUnit = .celsius,
                language: String?) {
        
        clientInfo.configure(appId: apiKey)
        clientInfo.configure(units: temperatureUnit)
        clientInfo.configure(language: language)
    }
}
