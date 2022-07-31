//
//  TownsListService.swift
//  MyWeatherApp
//
//  Created by Mohamed on 30/07/2022.
//

import Foundation
import MBWeather
import CoreData


class TownsListService {
    
    func getTownsList(_ completion: @escaping ([Town]) -> ()) {
        
        let towns = [Town]()
        completion(towns)
    }
    
    func getSavedTowns() -> [Town] {
        var towns = [Town]()
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return towns
        }
        let managedContext = appDelegate.appCoordinator.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CityWeather")
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            for data in result as! [NSManagedObject] {
                let town =  Town(name: data.value(forKey: "name") as? String ?? "")
                town.status = data.value(forKey: "status") as? String
                town.icon = data.value(forKey: "icon") as? String
                town.temp =  data.value(forKey: "temp") as? Double ?? 0.0
                town.pressure = data.value(forKey: "pressure") as? Double ?? 0.0
                town.humidity = data.value(forKey: "humidity") as? Double ?? 0.0
                town.visibility = data.value(forKey: "visibility") as? Double ?? 0.0
                town.windSpeed = data.value(forKey: "wind_speed") as? Double ?? 0.0
                towns.append(town)
            }
        } catch {
            
        }
        
        return towns
    }
    
}
