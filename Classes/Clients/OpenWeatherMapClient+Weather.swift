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
        return requestData(endpoint)
            .map({ (response, data) -> OneCallResponse in
                guard 200..<300 ~= response.statusCode else {
                    throw try OWMError(data: data)
                }
                return try JSONDecoder().decode(OneCallResponse.self, from: data)
            })
    }
}
