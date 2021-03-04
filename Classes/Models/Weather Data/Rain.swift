//
//  Rain.swift
//  WeatherApp-MVVMC
//
//  Created by Greener Chen on 2021/2/26.
//

import Foundation

public struct Rain {
    public let last1h: Float
    public let last3h: Float?
    
    enum CodingKeys: String, CodingKey {
        case last1h = "1h"
        case last3h = "3h"
    }
}

extension Rain: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        last1h = try container.decode(Float.self, forKey: .last1h)
        last3h = try container.decodeIfPresent(Float.self, forKey: .last3h) 
    }
}
