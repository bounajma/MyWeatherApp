//
//  UIViewController+Extensions.swift
//  MyWeatherApp
//
//  Created by Mohamed on 30/07/2022.
//

import Foundation
import UIKit


extension UIViewController {
    
    
    // show error
    func showError(error: Error) {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
        present(alert, animated: true)
    }
    
    // show activity indicator
    
    var activityIndicatorTag: Int { return 999999 }
    
    
    func startActivityIndicator() {
        
        DispatchQueue.main.async {
            
            let activityIndicator = UIActivityIndicatorView(style: .gray)
            activityIndicator.tag = self.activityIndicatorTag
            
            activityIndicator.center = self.view.center
            activityIndicator.hidesWhenStopped = true
            
            activityIndicator.startAnimating()
            self.view.addSubview(activityIndicator)
        }
    }
    
    func stopActivityIndicator() {
        
        DispatchQueue.main.async {
            if let activityIndicator = self.view.subviews.filter(
                { $0.tag == self.activityIndicatorTag}).first as? UIActivityIndicatorView {
                activityIndicator.stopAnimating()
                activityIndicator.removeFromSuperview()
            }
        }
    }
    
    
}
