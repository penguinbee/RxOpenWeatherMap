//
//  GeocodingApiClient.swift
//  WeatherApp-MVVMC
//
//  Created by Greener Chen on 2021/2/26.
//

import RxSwift
import RxAlamofire

struct GeocodingApiClient {
    func geoCoordinates(ofLocationName name: String, limit: Int = 10) -> Observable<[Location]> {
        let endpoint = GeocodingEndpoint.directGeocoding(location: name, limit: limit)
        return request(endpoint.httpMethod, endpoint)
            .responseData()
            .map({ (args) -> [Location] in
                let (_, data) = args
                return try JSONDecoder().decode([Location].self, from: data)
            })
    }
}
