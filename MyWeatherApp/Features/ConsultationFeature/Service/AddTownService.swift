//
//  AddTownService.swift
//  MyWeatherApp
//
//  Created by Mohamed on 30/07/2022.
//

import Foundation
import MBWeather
import CoreData


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
    
    func saveTown(_ town: Town) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.appCoordinator.persistentContainer.viewContext
        let townEntity = NSEntityDescription.entity(forEntityName: "CityWeather", in: managedContext)!
        let townIn = NSManagedObject(entity: townEntity, insertInto: managedContext)
        townIn.setValue(town.name, forKey: "name")
        townIn.setValue(town.status, forKey: "status")
        townIn.setValue(town.icon, forKey: "icon")
        townIn.setValue(town.temp, forKey: "temp")
        townIn.setValue(town.pressure, forKey: "pressure")
        townIn.setValue(town.humidity, forKey: "humidity")
        townIn.setValue(town.visibility, forKey: "visibility")
        townIn.setValue(town.windSpeed, forKey: "wind_speed")
        
        do {
            try managedContext.save()
        } catch {
            
        }
    }
    
}
