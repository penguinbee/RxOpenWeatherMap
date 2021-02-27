//
//  APIClientsTests.swift
//  OpenWeatherNetworkingTests
//
//  Created by Greener Chen on 2021/2/27.
//

import XCTest
import RxSwift
import RxBlocking

class APIClientsTests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDirectGeocoding() throws {
        let client = GeocodingApiClient()
        let result = client.geoCoordinates(ofLocationName: "Taipei")
            .toBlocking()
            .materialize()
            
        switch result {
        case .completed(let elements):
            guard let cities = elements.first else {
                XCTFail("Incorrect result - \(elements)")
                return
            }
            XCTAssert(cities.count > 1, "\(cities)")
            XCTAssertEqual(cities[0].name, "Taipei", "Incorrect city \(cities[0])")
        case .failed(_, let error):
            XCTFail("\(error)")
        }
    }
    
    func testWeatherOneCall() throws {
        let client = WeatherApiClient()
        let result = client.oneCall(latitude: 25.323, longitude: -123.435, excludes: [])
            .toBlocking()
            .materialize()
        
        switch result {
        case .completed(let elements):
            guard let weatherData = elements.first else {
                XCTFail("Incorrect result - \(elements)")
                return
            }
            XCTAssertEqual(weatherData.latitude, 25.323, "Incorrect latitude")
            XCTAssertEqual(weatherData.longitude, -123.435, "Incorrect longitude")
        case .failed(_, let error):
            XCTFail("\(error)")
        }
    }
}
