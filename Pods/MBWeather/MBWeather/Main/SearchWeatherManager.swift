//
//  SearchWeatherManager.swift
//  MBWeather
//
//  Created by Mohamed on 31/07/2022.
//

import Foundation

/**
 SearchWeatherManager
 A class For getting the weather information form a city coordinates
 */

public class SearchWeatherManager {
    
    /**
     getTownWeather
     A func that take a city coordinates in Params and return the weather information
     Params:
        lat: the latitude of the city
        lon: the longitude of the city
        completion: a closue of type (Result<WeatherResponse, RequestError>) -> ()
     */
    
    public static func getTownWeather(lat: Double,lon: Double, completion: @escaping (Result<WeatherResponse, RequestError>) -> ()) {
        
        let weatherEndpoint = WeatherEndpoint(lat: lat, lon: lon)
        WeatherAPIManager.sendRequest(endpoint: weatherEndpoint, responseModel: WeatherResponse.self) { response in
            
            completion(response)
            
        }
    }
    
}
