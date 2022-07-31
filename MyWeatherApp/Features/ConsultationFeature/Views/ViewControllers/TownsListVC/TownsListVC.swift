//
//  TownsListVC.swift
//  MBWeatherApp
//
//  Created by Mohamed on 30/07/2022.
//

import UIKit

protocol TownsListVCDelegate: NSObjectProtocol {
    func addTown()
    func showTownDetails(_ index: Int)
}

class TownsListVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    weak var delegate: TownsListVCDelegate?
    var viewModel: TownsListVM?
    
    var viewData = [TownViewData]() {
        didSet {
            self.stopActivityIndicator()
            self.updateViews()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        getData()
    }
    
    func setupViews() {
        self.navigationItem.title = "Liste des villes"
        let addBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(plusButtonTapped))
        self.navigationItem.rightBarButtonItem = addBarButton
        self.tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        self.tableView.register(UINib(nibName: TownsListCell.cellIdentifier , bundle: Bundle(for: TownsListCell.self)), forCellReuseIdentifier: TownsListCell.cellIdentifier)
        
    }
    
    func updateViews() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.reloadData()
    }
    func getData() {
        self.startActivityIndicator()
        self.viewModel?.bindTownsList = { [weak self] list in
            self?.viewData = list
        }
        self.viewModel?.getTownsList()
    }
    
    @objc func plusButtonTapped() {
        self.delegate?.addTown()
    }
}

extension TownsListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: TownsListCell.cellIdentifier, for: indexPath) as? TownsListCell {
            let model = self.viewData[indexPath.row]
            cell.updateViews(model)
            return cell
        }
        return TownsListCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.showTownDetails(indexPath.row)
    }
}
