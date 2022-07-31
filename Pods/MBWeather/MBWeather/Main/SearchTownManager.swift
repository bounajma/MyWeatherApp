//
//  SearchTownManager.swift
//  MBWeather
//
//  Created by Mohamed on 31/07/2022.
//

/**
 SearchTownManager
 A class For getting the geocode information form a city name
 */

import Foundation

public class SearchTownManager {
    
    /**
     searchTownByName
     A func that take a name: String in Params and return the geocode infos: Lat, Lon
     Params:
        name: the name of the city
        limit: the offset we want
        completion: a closue of type (Result<[GeoCode], RequestError>) -> ()
     */
    
    public static func searchTownByName(_ name: String, limit: Int, completion: @escaping (Result<[GeoCode], RequestError>) -> ()) {
        
        let endpoint = GeoCodeEndpoint(q: name, limit: limit)
        WeatherAPIManager.sendRequest(endpoint: endpoint, responseModel: [GeoCode].self) { result in
            completion(result)
        }
    }
}
