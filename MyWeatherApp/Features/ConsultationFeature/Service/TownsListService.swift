//
//  TownsListService.swift
//  MyWeatherApp
//
//  Created by Mohamed on 30/07/2022.
//

import Foundation
import MBWeather


class TownsListService {
    
    func getTownsList( _ completion: @escaping ([Town]) -> ()) {
        
        var towns = [Town]()
        let casa = Town(name: "Casablanca")
        casa.lat = 33.5951
        casa.lon = -7.6188
        casa.temp = 29.00
        let weather = WeatherInfo()
        weather.id = 801
        weather.main = "Clouds"
        weather.description = "few clouds"
        weather.icon = "02d"
        casa.weather = weather
        towns.append(casa)
        completion(towns)
    }
    
}
