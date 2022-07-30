//
//  ConsultationCoordinator.swift
//  MBWeatherApp
//
//  Created by Mohamed on 30/07/2022.
//

import Foundation
import UIKit


class ConsultationCoordinator: Coordinator {
    
    var navController: UINavigationController = UINavigationController()
    
    //MARK: Towns List Views
    var townsVC: TownsListVC?
    var townsVM: TownsListVM?
    var townsService: TownsListService?
    
    func start() {
        self.navController.navigationBar.prefersLargeTitles = true
        self.navController.navigationItem.largeTitleDisplayMode = .automatic
        self.navController.navigationBar.sizeToFit()
        self.navController.navigationBar.isTranslucent = false
        self.navController = UINavigationController(rootViewController: self.townsVC ?? UIViewController())
    }
    
}

