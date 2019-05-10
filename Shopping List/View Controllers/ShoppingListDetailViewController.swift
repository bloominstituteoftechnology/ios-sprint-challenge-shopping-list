//
//  ShoppingListDetailViewController.swift
//  Shopping List
//
//  Created by Jeremy Taylor on 5/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit
import UserNotifications

class ShoppingListDetailViewController: UIViewController {
    
    // MARK: - Properties
    var addedItemsCount: Int?
    let localNotificationHelper = LocalNotificationHelper()
    
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let addedItemsCount = addedItemsCount else { return }
        switch addedItemsCount {
        case 0:
            summaryLabel.text = "You currently have no items in your shopping list."
        case 1:
            summaryLabel.text = "You currently have 1 item in your shopping list."
        default:
            summaryLabel.text = "You currently have \(addedItemsCount) items in your shopping list."
        }
        
    }
    
    
    
    @IBAction func submitOrderTapped(_ sender: Any) {
        guard let name = nameTextField.text, !name.isEmpty,
            let address = addressTextField.text, !address.isEmpty else { return }
        
        localNotificationHelper.requestAuthorization { (success) in
            if success {
                self.createNotification()
            }
        }
    }
    
    private func createNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Delivery for \(nameTextField.text!)"
        content.body = "Your shopping items will be delivered to \(addressTextField.text!) in 15 minutes!"
        content.sound = UNNotificationSound.default()
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        
        let request = UNNotificationRequest(identifier: "ShoppingDelivery", content: content, trigger: trigger)
        
        // Schedule the request with the system.
        let notificationCenter = UNUserNotificationCenter.current()
        
        notificationCenter.add(request) { (error) in
            if let error = error  {
                NSLog("Error scheduling notification \(error)")
                return
            }
            
        }
    }
}
