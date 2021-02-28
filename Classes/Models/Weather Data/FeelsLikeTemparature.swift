//
//  FeelsLikeTemparature.swift
//  WeatherApp-MVVMC
//
//  Created by Greener Chen on 2021/2/26.
//

import Foundation

public struct FeelsLikeTemparature {
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

extension FeelsLikeTemparature: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        day = try container.decode(Float.self, forKey: .day)
        night = try container.decode(Float.self, forKey: .night)
        evening = try container.decode(Float.self, forKey: .evening)
        morning = try container.decode(Float.self, forKey: .morning)
    }
}
