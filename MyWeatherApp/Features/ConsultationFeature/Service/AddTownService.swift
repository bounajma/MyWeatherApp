//
//  AddTownService.swift
//  MyWeatherApp
//
//  Created by Mohamed on 30/07/2022.
//

import Foundation
import MBWeather


class AddTownService {
    
    func searchTownByName(_ name: String, completion: @escaping (Result<[GeoCode], RequestError>) -> ()) {
        let endpoint = GeoCodeEndpoint(q: name, limit: 1)
        WeatherAPIManager.sendRequest(endpoint: endpoint, responseModel: [GeoCode].self) { result in
            completion(result)
        }
    }
    
    func getTownWeather(lat: Double,lon: Double, completion: @escaping (Result<WeatherResponse, RequestError>) -> ()) {
        let weatherEndpoint = WeatherEndpoint(lat: lat, lon: lon)
        WeatherAPIManager.sendRequest(endpoint: weatherEndpoint, responseModel: WeatherResponse.self) { response in
            
            completion(response)
            
        }
    }
    
}
