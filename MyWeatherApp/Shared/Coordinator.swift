//
//  Coordinator.swift
//  MyWeatherApp
//
//  Created by Mohamed on 30/07/2022.
//

import Foundation
import UIKit

protocol Coordinator {
    var navController: UINavigationController { get set }
    func start()
}
