//
//  WeatherApiClient.swift
//  WeatherApp-MVVMC
//
//  Created by Greener Chen on 2021/2/26.
//

import RxSwift
import RxAlamofire

struct WeatherApiClient {
    func oneCall(latitude: Double, longitude: Double, excludes: [WeatherDataType] = [.minutely, .alerts]) -> Observable<OneCallResponse> {
        let endpoint = WeatherDataEndpoint.oneCall(latitude: latitude, longitude: longitude, excludes: excludes)
        return request(endpoint.httpMethod, endpoint)
            .responseData()
            .map { (args) -> OneCallResponse in
                let (_, data) = args
                return try OneCallResponse(data: data)
            }
    }
}
