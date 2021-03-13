//
//  WeatherApiClient.swift
//  WeatherApp-MVVMC
//
//  Created by Greener Chen on 2021/2/26.
//

import RxSwift
import RxAlamofire

extension OpenWeatherMapClient {

    public func oneCall(latitude: Double, longitude: Double, excludes: [WeatherDataType] = [.minutely, .alerts]) throws -> Observable<OneCallResponse> {
        let endpoint = WeatherDataEndpoint.oneCall(latitude: latitude, longitude: longitude, excludes: excludes)
        return try decodable(endpoint.httpMethod, endpoint.asURL())
    }
}
