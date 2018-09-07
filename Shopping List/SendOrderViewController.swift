//
//  SendOrderViewController.swift
//  Shopping List
//
//  Created by Daniela Parra on 9/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class SendOrderViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateNumber()
    }
    
    //Calculate number
    private func updateNumber() {
        
        var numberofShoppingItems = 0
        
        if let shoppingItemController = shoppingItemController {
        
            for item in shoppingItemController.shoppingItems{
                if item.isAdded == true {
                    numberofShoppingItems += 1
                }
            }
        }
        numberOfItemsLabel.text = "You currently have \(numberofShoppingItems) item(s) in your shopping list."
    }
    
    @IBAction func sendOrder(_ sender: Any) {
        guard let name = nameTextField.text,
            let address = addressTextField.text else { return }
        
        localNotificationHelper.getAuthorizationStatus { (status) in
            switch status {
            case .notDetermined:
                self.localNotificationHelper.requestAuthorization { (granted) in
                    self.localNotificationHelper.scheduleDeliveryNotification(name: name, address: address)
                }
            case .authorized:
                self.localNotificationHelper.scheduleDeliveryNotification(name: name, address: address)
            
            case .denied:
                break
            }
        }
        
    }
    
    let localNotificationHelper = LocalNotificationHelper()
    var shoppingItemController: ShoppingItemController?
    
    @IBOutlet weak var numberOfItemsLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
}
