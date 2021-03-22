//
//  ErrorResponse.swift
//  OpenWeatherNetworking
//
//  Created by Greener Chen on 2021/3/17.
//

import Foundation

public struct OWMError: Error, Codable {
    public let code: String
    public let message: String
    
    public enum CodingKeys: String, CodingKey {
        case code = "cod"
        case message
    }
    
}

extension OWMError {
    public init(data: Data, using decoder: JSONDecoder = .init()) throws {
        self = try decoder.decode(OWMError.self, from: data)
    }
}
