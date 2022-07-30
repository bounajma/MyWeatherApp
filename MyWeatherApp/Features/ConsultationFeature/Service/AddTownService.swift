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
    
}
