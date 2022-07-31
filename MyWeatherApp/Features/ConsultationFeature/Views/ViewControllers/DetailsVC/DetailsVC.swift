//
//  DetailsVC.swift
//  MyWeatherApp
//
//  Created by Mohamed on 31/07/2022.
//

import UIKit

class DetailsVC: UIViewController {
    
    @IBOutlet weak var statusIcon: UIImageView!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var visibilityLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    
    var town: Town?
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupViews()
    }
    
    func setupViews() {
        self.navigationItem.title = town?.name
        self.statusIcon.image = UIImage(named: town?.icon ?? "01n")
        self.statusLabel.text = town?.status
        self.tempLabel.text =  "\(town?.temp ?? 0)"
        self.pressureLabel.text =  "\(town?.pressure ?? 0)"
        self.humidityLabel.text =  "\(town?.humidity ?? 0)"
        self.visibilityLabel.text =  "\(town?.visibility ?? 0)"
        self.windSpeedLabel.text =  "\(town?.windSpeed ?? 0)"
    }

}
