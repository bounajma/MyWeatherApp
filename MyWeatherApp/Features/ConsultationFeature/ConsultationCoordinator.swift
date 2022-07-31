//
//  ConsultationCoordinator.swift
//  MBWeatherApp
//
//  Created by Mohamed on 30/07/2022.
//

import Foundation
import UIKit


class ConsultationCoordinator: NSObject, Coordinator {
    
    var navController: UINavigationController = UINavigationController()
    
    //MARK: Towns List
    var townsVC: TownsListVC?
    var townsVM: TownsListVM?
    var townsService: TownsListService?
    
    //MARK: Add town
    var addTownVC: AddTownVC?
    var addTownVM: AddTownVM?
    var addTownService: AddTownService?
    
    //MARK: Details
    var detailsVC: DetailsVC?
    
    
    func start() {
        self.navController.navigationBar.prefersLargeTitles = true
        self.navController.navigationItem.largeTitleDisplayMode = .automatic
        self.navController.navigationBar.sizeToFit()
        self.navController.navigationBar.isTranslucent = false
        self.townsVC?.delegate = self
        self.navController = UINavigationController(rootViewController: self.townsVC ?? UIViewController())
    }
    func showAddVC() {
        if let add = self.addTownVC {
            add.delegate = self
            self.navController.present(add, animated: true)
        }
    }
    func showDetailsVC(_ index: Int) {
        if let details = self.detailsVC {
            details.town = self.townsVM?.townsList?[index]
            self.navController.pushViewController(details, animated: true)
        }
    }
    
}

// TownsListVCDelegate
extension ConsultationCoordinator: TownsListVCDelegate {
    func showTownDetails(_ index: Int) {
        self.showDetailsVC(index)
    }
    
    
    func addTown() {
        showAddVC()
    }
}

//
extension ConsultationCoordinator: AddTownVCDelegate {
    func updateTownsList() {
        self.townsVC?.getData()
    }
}

