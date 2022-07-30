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
        self.weatherStatus = town.weather?.main
        self.weatherIcon = town.weather?.icon
        self.temp = "\(town.temp)" 
    }
}
