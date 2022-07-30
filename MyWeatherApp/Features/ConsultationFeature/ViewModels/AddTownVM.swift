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
    
}
