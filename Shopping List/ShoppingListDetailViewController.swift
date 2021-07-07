//
//  ShoppingListDetailViewController.swift
//  Shopping List
//
//  Created by Samantha Gatt on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListDetailViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateViews()
    }
    
    
    // MARK: - Functions
    
    func updateViews() {
        guard let number = numberInCart else { return }
        numberOfItemsLabel.text = "You currently have \(number) item(s) in your shopping list."
    }
    
    
    // MARK: - Actions
    
    @IBAction func sendOrder(_ sender: Any) {
        guard let name = nameTextField.text,
            let address = adressTextField.text else {
                return
        }
        localNotificationHelper.requestAuthorization { (success) in
            if success == true {
                self.localNotificationHelper.sendNotification(name: name, address: address)
            }
        }
    }
    
    
    
    // MARK: - Properties
    
    var numberInCart: Int?
    let localNotificationHelper = LocalNotificationHelper()
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var numberOfItemsLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var adressTextField: UITextField!
    
}
