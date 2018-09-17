//
//  CartViewController.swift
//  Shopping List
//
//  Created by Rick Wolter on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit
 import UserNotifications

class CartViewController: UIViewController,UNUserNotificationCenterDelegate {

   var notification: Notification?
    var shoppingItemController: ShoppingItemController?
    
    @IBOutlet weak var itemsInCartLabel: UILabel!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var userAddressTextField: UITextField!
    
    @IBAction func sendOrderButton(_ sender: Any) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateCart()
    }
    
    //Calculate number
    private func updateCart() {
        
        var itemNumber = 0
        
        guard let shoppingItemController = shoppingItemController else {return}
            
            for item in shoppingItemController.shoppingItems{
                if item.isInList {
                    itemNumber += 1
                }
            }
        
        itemsInCartLabel.text = "You currently have \(itemNumber) item(s) in your shopping cart."
    }
    
    @IBAction func sendOrder(_ sender: Any) {
        guard let name = userNameTextField.text,
            let address = userAddressTextField.text,
            let notification = notification else { return }
        
            notification.getAuthorizationStatus { (status) in
            switch status {
            case .notDetermined:
                notification.requestAuthorization { (granted) in
                    notification.scheduleDeliveryNotification(name: name, address: address)
                }
            case .authorized:
                notification.scheduleDeliveryNotification(name: name, address: address)
            case .denied:
                return
            }
        }
        navigationController?.popViewController(animated: true)
        
    }
    
   
    

}
