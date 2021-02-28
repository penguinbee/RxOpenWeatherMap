//
//  Endpoint.swift
//  WeatherApp-MVVMC
//
//  Created by Greener Chen on 2021/2/25.
//

import Foundation
import Alamofire

protocol Endpoint: URLRequestConvertible, URLConvertible {
    var path: String { get }
    var httpMethod: Alamofire.HTTPMethod { get }
    var queryItems: [String:Any]? { get }
}

// MARK: - Properties
extension Endpoint {
    var httpMethod: Alamofire.HTTPMethod {
        .get
    }
}

// MARK: - Helpers
extension Endpoint {
    public func asURLRequest() throws -> URLRequest {
        return try URLRequest(url: asURL(), method: httpMethod)
    }
    
    public func asURL() throws -> URL {
        var urlComponents = URLComponents(string: geocodingURL + path)
        urlComponents?.queryItems = queryItems?.compactMap { URLQueryItem(name: $0.key, value: "\($0.value)") }
        guard let url = urlComponents?.url else { throw EndpointError.urlConversionError }
        return url
    }
}

public enum EndpointError: Error {
    case urlConversionError
}
