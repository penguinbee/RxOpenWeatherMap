//
//  APIClientsTests.swift
//  OpenWeatherNetworkingTests
//
//  Created by Greener Chen on 2021/2/27.
//

import XCTest
import RxSwift
import RxBlocking
@testable import OpenWeatherNetworking

class APIClientsTests: XCTestCase {
    
    var client: OpenWeatherMapClient!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        client = OpenWeatherMapClient(apiKey: "PUT_YOUR_TOKEN_HERE",
                                       temperatureUnit: .celsius,
                                       language: "en")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDirectGeocoding() throws {
        let result = try client.geoCoordinates(ofLocationName: "Taipei")
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
    
    func testReverseGeocoding() throws {
        let result = try client.reverseGeoCoordinates(latitude: 25.032075421473728, longitude: 121.55796224369142)
            .toBlocking()
            .materialize()
            
        switch result {
        case .completed(let elements):
            guard let cities = elements.first else {
                XCTFail("Incorrect result - \(elements)")
                return
            }
            XCTAssert(cities.count > 1, "\(cities)")
            XCTAssertEqual(cities[1].name, "Taipei", "Incorrect city \(cities[1])")
        case .failed(_, let error):
            XCTFail("\(error)")
        }
    }
    
    func testWeatherOneCall_Rain() throws {
        // Taipei
        let result = try client.oneCall(latitude: 25.105497, longitude: 121.597366, excludes: [])
            .toBlocking()
            .materialize()
        
        switch result {
        case .completed(let elements):
            guard let weatherData = elements.first else {
                XCTFail("Incorrect result - \(elements)")
                return
            }
            XCTAssertEqual(weatherData.latitude, 25.1055, "Incorrect latitude")
            XCTAssertEqual(weatherData.longitude, 121.5974, "Incorrect longitude")
        case .failed(_, let error):
            XCTFail("\(error)")
        }
    }
    
    func testWeatherOneCall_Snow() throws {
        // Moscow
        let result = try client.oneCall(latitude: 55.751244, longitude: 37.618423, excludes: [])
            .toBlocking()
            .materialize()
        
        switch result {
        case .completed(let elements):
            guard let weatherData = elements.first else {
                XCTFail("Incorrect result - \(elements)")
                return
            }
            XCTAssertEqual(weatherData.latitude, 55.7512, "Incorrect latitude")
            XCTAssertEqual(weatherData.longitude, 37.6184, "Incorrect longitude")
        case .failed(_, let error):
            XCTFail("\(error)")
        }
    }
}
