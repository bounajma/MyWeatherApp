//
//  AppCoordinator.swift
//  MyWeatherApp
//
//  Created by Mohamed on 30/07/2022.
//

import Foundation
import UIKit


class AppCoordinator {
    
    var window: UIWindow?
    
    //TODO: Use a  DIContiner for dependency injection to make this class testable
    let consultation = ConsultationCoordinator()
    
    func start(window: UIWindow?) {
       
        self.window = window
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.startConsultation()
        self.window?.rootViewController = self.consultation.navController
        self.window?.makeKeyAndVisible()
    }
    
    func startConsultation () {
        
        let vc = TownsListVC()
        let vm = TownsListVM()
        let service = TownsListService()
        vm.townsService = service
        vc.viewModel = vm
        self.consultation.townsService = service
        self.consultation.townsVM = vm
        self.consultation.townsVC = vc
        
        
        let addVC = AddTownVC()
        let addVM = AddTownVM()
        let addService = AddTownService()
        addVM.addService = addService
        addVC.viewModel = addVM
        
        self.consultation.addTownService = addService
        self.consultation.addTownVM = addVM
        self.consultation.addTownVC = addVC
        
        self.consultation.start()
    }
    
}
