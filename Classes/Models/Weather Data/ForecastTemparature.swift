//
//  ForecaseTemparature.swift
//  WeatherApp-MVVMC
//
//  Created by Greener Chen on 2021/2/26.
//

import Foundation

public struct ForecastTemparature: Codable {
    public let day: Float
    public let min: Float
    public let max: Float
    public let night: Float
    public let evening: Float
    public let morning: Float
    
    enum CodingKeys: String, CodingKey {
        case day
        case min
        case max
        case night
        case evening = "eve"
        case morning = "morn"
    }
}
