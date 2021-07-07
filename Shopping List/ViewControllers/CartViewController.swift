//
//  CartViewController.swift
//  Shopping List
//
//  Created by Rick Wolter on 10/19/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit
import UserNotifications

class CartViewController: UIViewController, UNUserNotificationCenterDelegate {

  
    var shoppingItemController: ShoppingItemController?
    var notification: Notification?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var itemsLabel: UILabel!
    
    
    override func viewDidLoad() {
        updateCart()
    }
    
    
    @IBAction func order(_ sender: Any) {
        guard let name = nameTextField.text,
            let address = addressTextField.text,
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
                default:
                    return
                }
            }
            navigationController?.popViewController(animated: true)
        }
        

private func updateCart() {
    
    var itemNumber = 0
    
    guard let shoppingItemController = shoppingItemController else {return}
    
    for item in shoppingItemController.shoppingItems{
        if item.isInList {
            itemNumber += 1
        }
    }
    }
}
