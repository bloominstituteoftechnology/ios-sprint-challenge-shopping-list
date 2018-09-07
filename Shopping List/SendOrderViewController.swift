//
//  SendOrderViewController.swift
//  Shopping List
//
//  Created by Daniela Parra on 9/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit
import UserNotifications

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
            let address = addressTextField.text,
            let localNotificationHelper = localNotificationHelper else { return }
        
        localNotificationHelper.getAuthorizationStatus { (status) in
            switch status {
            case .notDetermined:
                localNotificationHelper.requestAuthorization { (granted) in
                    localNotificationHelper.scheduleDeliveryNotification(name: name, address: address)
                }
            case .authorized:
                localNotificationHelper.scheduleDeliveryNotification(name: name, address: address)
            
            case .denied:
                break
            }
        }
        
        navigationController?.popViewController(animated: true)
        
    }
    
    var localNotificationHelper: LocalNotificationHelper?
    var shoppingItemController: ShoppingItemController?
    
    @IBOutlet weak var numberOfItemsLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
}
