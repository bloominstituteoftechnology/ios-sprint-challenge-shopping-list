//
//  AddItemDetailViewController.swift
//  Shopping List
//
//  Created by Donella Barcelo on 11/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class AddItemDetailViewController: UIViewController {
    
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var sendToNameTextField: UITextField!
    @IBOutlet weak var sendToAddressTextField: UITextField!
    
    var delegate: [ShoppingItem]? {
        didSet {
            updateView()
        }
    }
    // MARK: - Functions
    
    override func viewDidDisappear(_ animated: Bool) {

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    func updateView() {
        guard let count = delegate?.count else { return }
        self.itemLabel.text = "You have \(count) item(s) in your shopping list."
    }
    
    @IBAction func sendOrderButtonTapped(_ sender: Any) {
        guard let name = sendToNameTextField.text, let address = sendToAddressTextField.text, let count = delegate?.count else { return }
        
        let alert = UIAlertController(title: "Thank you, \(name) your order has been place!", message: "You will have \(count) item(s) that will be sent to \(address).", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        present(alert, animated: true, completion: nil)
        
    }
}
