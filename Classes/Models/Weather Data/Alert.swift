//
//  Alert.swift
//  OpenWeatherNetworking
//
//  Created by Greener Chen on 2021/2/28.
//

import Foundation

public struct Alert: Codable {
    public let senderName: String
    public let event: String
    public let start: TimeInterval
    public let end: TimeInterval
    public let description: String
    
    enum CodingKeys: String, CodingKey {
        case senderName = "sender_name"
        case event
        case start
        case end
        case description
    }
}
