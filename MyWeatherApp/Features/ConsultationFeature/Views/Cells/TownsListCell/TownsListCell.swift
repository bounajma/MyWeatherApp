//
//  TownsListCell.swift
//  MBWeatherApp
//
//  Created by Mohamed on 30/07/2022.
//

import UIKit

class TownsListCell: UITableViewCell {
    
    static let cellIdentifier = "TownsListCell"
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var statusIcon: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    func setupViews() {
        cityLabel.layer.cornerRadius = 7
        tempLabel.layer.cornerRadius = 7
    }
    
    func updateViews(_ town: TownViewData) {
        self.cityLabel.text = town.name
        self.tempLabel.text = town.temp
        self.statusLabel.text = town.weatherStatus
        self.statusIcon.image = UIImage(named: town.weatherIcon ?? "01d")
    }
    
}
