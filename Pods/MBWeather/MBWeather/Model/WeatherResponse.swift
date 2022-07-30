//
//  WeatherResponse.swift
//  TestApp
//
//  Created by Mohamed on 29/07/2022.
//

import Foundation

public class WeatherInfo: Codable {
    public var id: Double?
    public var main: String?
    public var description: String?
    public var icon: String?
    public init() {
        
    }
}

public class CurrentWeather: Codable {
    public var dt: Double?
    public var sunrise: Double?
    public var sunset : Double?
    public var temp: Double?
    public var feels_like: Double?
    public var pressure: Double?
    public var humidity: Double?
    public var dew_point: Double?
    public var uvi : Double?
    public var clouds: Double?
    public var visibility: Double?
    public var wind_speed: Double?
    public var wind_deg: Double?
    public var weather: [WeatherInfo?]?
}

public class WeatherResponse: Codable {
    
    public var lat: Double?
    public var lon: Double?
    public var timezone: String?
    public var timezone_offset: Double?
    public var current: CurrentWeather?
}
