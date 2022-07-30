//
//  TownsListVM.swift
//  MBWeatherApp
//
//  Created by Mohamed on 30/07/2022.
//

import Foundation


class TownsListVM {
    
    var townsService: TownsListService!
    
    var townsList: [Town]? {
        didSet {
            let viewData = townsList?.map { TownViewData(town: $0) } ?? []
            bindTownsList?(viewData)
        }
    }
    
    var bindTownsList: (([TownViewData]) -> ())?
    
    func getTownsList() {
        self.townsService.getTownsList { list in
            self.townsList = list
        }
    }
    
}
