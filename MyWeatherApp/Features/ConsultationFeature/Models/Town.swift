//
//  City.swift
//  MBWeatherApp
//
//  Created by Mohamed on 30/07/2022.
//

import Foundation
import MBWeather


class Town {
   
    let name: String
    var lat: Double = 0.0
    var lon: Double = 0.0
    var temp: Double = 0.0
    var weather: WeatherInfo?
    
    
    
    init(name: String) {
        self.name = name
    }
}
