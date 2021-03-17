//
//  ErrorResponse.swift
//  OpenWeatherNetworking
//
//  Created by Greener Chen on 2021/3/17.
//

import Foundation

public struct OWMError: Error {
    public let code: String
    public let message: String
    
    public enum CodingKeys: String, CodingKey {
        case code = "cod"
        case message
    }
    
}

extension OWMError: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        code = try container.decode(String.self, forKey: .code)
        message = try container.decode(String.self, forKey: .message)
    }
}

extension OWMError {
    public init(data: Data, using decoder: JSONDecoder = .init()) throws {
        self = try decoder.decode(OWMError.self, from: data)
    }
}
