//
//  WeatherEndpoint.swift
//  TestApp
//
//  Created by Mohamed on 28/07/2022.
//

import Foundation

public class WeatherEndpoint: Endpoint {
    
    let APIKey = "93f7e20f81671abdb08c1911cdc10408"
    var lat: Double
    var lon: Double
    
    public init(lat: Double, lon: Double) {
        self.lat = lat
        self.lon = lon
    }
    
    public var path: String {
        return "/data/2.5/onecall"
    }
    
    public var method: RequestMethod {
        return .get
    }
    
    public var header: [String : String]? {
        return nil
    }
    
    public var queryParams: [URLQueryItem]? {
        return [URLQueryItem(name: "lat", value: "\(self.lat)"), URLQueryItem(name: "lon", value: "\(self.lon)"), URLQueryItem(name: "appid", value: "\(self.APIKey)"), URLQueryItem(name: "exclude", value: "hourly,minutely,alerts,daily"), URLQueryItem(name: "units", value: "metric")]
    }
    
}
