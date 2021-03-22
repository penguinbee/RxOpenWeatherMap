//
//  FeelsLikeTemparature.swift
//  WeatherApp-MVVMC
//
//  Created by Greener Chen on 2021/2/26.
//

import Foundation

public struct FeelsLikeTemparature: Codable {
    public let day: Float
    public let night: Float
    public let evening: Float
    public let morning: Float
    
    enum CodingKeys: String, CodingKey {
        case day
        case night
        case evening = "eve"
        case morning = "morn"
    }
}
