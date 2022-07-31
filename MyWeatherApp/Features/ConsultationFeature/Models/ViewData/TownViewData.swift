//
//  City.swift
//  MBWeatherApp
//
//  Created by Mohamed on 30/07/2022.
//

import Foundation

class TownViewData {
   
    let name: String
    var weatherStatus: String?
    var weatherIcon: String?
    var temp: String?
    
    init(town: Town) {
        self.name = town.name
        self.weatherStatus = town.status
        self.weatherIcon = town.icon
        self.temp = "\(town.temp) °C"
    }
}
