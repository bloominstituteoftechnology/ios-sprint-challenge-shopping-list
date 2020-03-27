//
//  SubmitOrderViewController.swift
//  Shopping List
//
//  Created by Hunter Oppel on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class SubmitOrderViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet weak var informationLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    // MARK: Properties
    var shoppingController: ShoppingListController?
    var addedItems: [ShoppingItem]? {
        let addedItems = shoppingController?.shoppingList.filter { $0.didAdd }
        return addedItems
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let addedItems = addedItems {
            informationLabel.text = "You have \(addedItems.count) item(s) in your cart."
        }
    }
    
    // MARK: - Actions
    
    @IBAction func submitOrder(_ sender: Any) {
        showAlert()
    }
    
    // MARK: - Functions
    
    func showAlert() {
        guard let name = nameTextField.text,
            let address = addressTextField.text,
            let addedItems = addedItems else {return}
        let alert = UIAlertController(title: "Order submitted",
                                      message: "\(name), your order of \(addedItems.count) item(s) has been delivered to \(address).",
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
}
