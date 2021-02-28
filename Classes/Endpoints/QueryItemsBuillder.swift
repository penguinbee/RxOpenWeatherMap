//
//  QueryItemsBuillder.swift
//  OpenWeatherNetworking
//
//  Created by Greener Chen on 2021/3/1.
//

class QueryItemsBuillder {
    
    var items: [String:Any] = [:]
    
    @discardableResult
    func addItem(key: String, value: Any?) -> Self {
        items[key] = value
        return self
    }
}
