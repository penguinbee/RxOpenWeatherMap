//
//  GeocodingApiClient.swift
//  WeatherApp-MVVMC
//
//  Created by Greener Chen on 2021/2/26.
//

import RxSwift
import RxAlamofire

extension OpenWeatherClient {
    
    public func geoCoordinates(ofLocationName name: String, limit: Int = 10) throws -> Observable<[Location]> {
        let endpoint = GeocodingEndpoint.directGeocoding(location: name, limit: limit)
        return decodable(endpoint.httpMethod, endpoint)
    }
}
