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
    var status: String?
    var icon: String?
    var temp: Double = 0.0
    var pressure: Double = 0.0
    var humidity: Double = 0.0
    var visibility: Double = 0.0
    var windSpeed: Double = 0.0
    
    init(name: String) {
        self.name = name
    }
}
