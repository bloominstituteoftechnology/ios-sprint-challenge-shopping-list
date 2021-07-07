//
//  OrderingViewController.swift
//  Shopping List
//
//  Created by Lisa Sampson on 8/10/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class OrderingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       updateViews()
    }
    
    @IBAction func sendOrder(_ sender: Any) {
        guard let name = nameTextField.text,
            let address = addressTextField.text else { return }
        
        localNotificationHelper.requestAuthorization { (success) in
            if success == true {
                self.localNotificationHelper.scheduleDailyReminderNotification(name: name, address: address)
            }
        }
    }
    
    func updateViews() {
        guard let shoppingItems = shoppingItemController?.shoppingItems else { return }
        
        var numberOfItems = 0
        for item in shoppingItems {
            if item.isAdded {
                numberOfItems += 1
            }
        }
        textLabel?.text = "You currently have (\(numberOfItems) item(s) in your shopping cart."
    }
    
    let localNotificationHelper = LocalNotificationHelper()
    var shoppingItemController: ShoppingItemController? {
        didSet {
            updateViews()
        }
    }
    
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
}
