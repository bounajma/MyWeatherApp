//
//  TownsListVM.swift
//  MBWeatherApp
//
//  Created by Mohamed on 30/07/2022.
//

import Foundation


class TownsListVM {
    
    var townsService: TownsService!
    var townsList: [Town]?
    var townsViewsData: [TownViewData]? {
        didSet {
            bindTownsList?(townsViewsData ?? [])
        }
    }
    
    var bindTownsList: (([TownViewData]) -> ())?
    
    func getTownsList() {
        let townsList = self.townsService.getSavedTowns()
        self.townsList = townsList
        self.townsViewsData = townsList.map { TownViewData(town: $0) }
    }
    
}
