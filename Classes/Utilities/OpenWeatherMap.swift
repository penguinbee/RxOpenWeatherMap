//
//  OpenWeatherMap.swift
//  OpenWeatherNetworking
//
//  Created by Greener Chen on 2021/3/14.
//

import Foundation

public struct OpenWeatherMap {
    public static func url(forIcon icon: String?) -> URL? {
        guard let icon = icon else { return nil }
        return URL(string: "http://openweathermap.org/img/wn/\(icon)@2x.png")
    }
}
