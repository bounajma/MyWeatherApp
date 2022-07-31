//
//  AddTownVM.swift
//  MyWeatherApp
//
//  Created by Mohamed on 30/07/2022.
//

import Foundation
import MBWeather


class AddTownVM {
    
    var addService: AddTownService!
    
    var town: GeoCode? {
        didSet {
            DispatchQueue.main.async {
                self.bindResultMessage?( "Un résultat est trouvé: \(self.town?.name ?? ""), cliquer sur ajouter pour  continuer." )
                self.bindButtonState?(true)
            }
        }
    }
    var error: RequestError? {
        didSet {
            DispatchQueue.main.async {
                self.bindResultMessage?( "une erreur est survenue, Merci de réessayer" )
                self.bindButtonState?(false)
            }
        }
    }
    
    var bindResultMessage: ((String) -> ())?
    var bindButtonState: ((Bool) -> ())?
    var notifyAdd: (() -> ())?
    
    
    func searchTown(_ name: String?) {
        guard let name = name, name.count >= 3 else {
            self.error = RequestError.unknown
            return
        }
        self.addService.searchTownByName(name) { result in
            
            switch result {
            case .success(let value):
                if value.count > 0 {
                    self.town = value[0]
                } else {
                    self.error = .unknown
                }
            case .failure(let error):
                self.error = error
            }
            
        }
    }
    
    func getWether() {
        guard let geocode = self.town, let lat = geocode.lat, let lon = geocode.lon else {
            return
        }
        self.addService.getTownWeather(lat: lat, lon: lon) { result in
            switch result {
            case .success(let value):
                let town = Town(name: self.town?.name ?? "")
                if let weathers = value.current?.weather, weathers.count > 0 {
                    town.status = weathers[0]?.main
                    town.icon = weathers[0]?.icon
                }
                town.temp = value.current?.temp ?? 0.0
                town.pressure = value.current?.pressure ?? 0.0
                town.visibility = value.current?.visibility ?? 0.0
                town.humidity = value.current?.humidity ?? 0.0
                town.windSpeed = value.current?.wind_speed ?? 0.0
                self.addService.saveTown(town)
                DispatchQueue.main.async {
                    self.notifyAdd?()
                }
            case .failure(_):
                break
            }
        }
    }
    
    
}
