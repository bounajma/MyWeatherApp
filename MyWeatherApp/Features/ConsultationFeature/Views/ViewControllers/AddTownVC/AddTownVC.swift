//
//  AddTownVC.swift
//  MyWeatherApp
//
//  Created by Mohamed on 30/07/2022.
//

import UIKit

protocol AddTownVCDelegate: NSObjectProtocol {
    func updateTownsList()
}

class AddTownVC: UIViewController {

    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    
    var viewModel: AddTownVM?
    weak var delegate: AddTownVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        
        self.searchTextField.delegate = self
        self.searchTextField.addTarget(self, action: #selector(textChanged(_:)), for: .editingChanged)
        self.viewModel?.bindButtonState = { [weak self] state in
            self?.stopActivityIndicator()
            self?.addButton.isEnabled = state
        }
        self.viewModel?.bindResultMessage = { [weak self] text in
            self?.resultLabel.text = text
        }
        self.viewModel?.notifyAdd = {
            self.delegate?.updateTownsList()
            self.dismiss(animated: true)
        }
    }
    
    @IBAction func cancelSearch(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    @IBAction func addTown(_ sender: UIButton) {
        self.viewModel?.getWether()
    }
    
    @objc func textChanged(_ textField: UITextField) {
        NSObject.cancelPreviousPerformRequests(
                withTarget: self,
                selector: #selector(searchTownByName),
                object: searchTextField)
            self.perform(
                #selector(searchTownByName),
                with: searchTextField,
                afterDelay: 0.5)
    }
    
    @objc func searchTownByName() {
        self.startActivityIndicator()
        self.viewModel?.searchTown(self.searchTextField.text)
    }
    
    
}

extension AddTownVC: UITextFieldDelegate {
    
    
    
}
