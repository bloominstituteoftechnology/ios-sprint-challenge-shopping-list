//
//  ShoppingDetailViewController.swift
//  Shopping List
//
//  Created by Linh Bouniol on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ShoppingDetailViewController: UIViewController {

    // MARK: - Properties
    
    var shoppingItemController: ShoppingItemController? { // ass did set for updateViews()
        didSet {
            updateViews()
        }
    }
    
    let localNotificationHelper = LocalNotificationHelper()
    
    @IBOutlet var textLabel: UILabel!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var addressTextField: UITextField!
    
    @IBAction func sendOrder(_ sender: Any) {
        guard let name = nameTextField.text, let address = addressTextField.text else { return }
        
        
        localNotificationHelper.requestAuthorization() { (success) in
            if success  == true {
                self.localNotificationHelper.scheduleDailyReminderNotification(name: name, address: address)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    
    func updateViews() {
        guard let shoppingItems = shoppingItemController?.shoppingItems else { return }
        
        var numberOfItems = 0
        for item in shoppingItems {
            if item.isAdded {
                numberOfItems += 1
            }
        }
        
        // use numberOfItems to build your string
        textLabel?.text = "You currently have \(numberOfItems) item(s) in your shopping list."
    }
}
