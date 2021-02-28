//
//  ClientInfo.swift
//  OpenWeatherNetworking
//
//  Created by Greener Chen on 2021/3/1.
//

import Foundation

class ClientInfo {
    
    static let shared = ClientInfo()
    
    var appId: String = ""
    var units: String = ""
    var language: String?
    
    func configure(appId: String) {
        self.appId = appId
    }
    
    func configure(units: TemperatureUnit) {
        self.units = units.rawValue
    }
    
    func configure(language: String?) {
        self.language = language?.lowercased()
    }
}
