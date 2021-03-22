//
//  Snow.swift
//  WeatherApp-MVVMC
//
//  Created by Greener Chen on 2021/2/26.
//

import Foundation

public struct Snow: Codable {
    public let last1h: Float
    public let last3h: Float?
    
    enum CodingKeys: String, CodingKey {
        case last1h = "1h"
        case last3h = "3h"
    }
}
