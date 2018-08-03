//
//  ShopingListDetailViewController.swift
//  Shopping List
//
//  Created by Jeremy Taylor on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit
import UserNotifications
class ShopingListDetailViewController: UIViewController {
    
    var addedItems = 0
    
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    @IBAction func sendOrder(_ sender: Any) {
        
        guard let name = nameTextField.text,
            let address = addressTextField.text else { return }
        
        localNotificationHelper.requestAuthorization { (success) in
            if success {
                self.createNotification()
            }
        }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        summaryLabel.text = "You currently have \(addedItems) item(s) in your shopping list"
    }
    
    private func createNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Delivery for \(nameTextField.text!)"
        content.body = "Your shopping items will be delivered to \(addressTextField.text!) in 15 minutes!"
        content.sound = UNNotificationSound.default()
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
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

    let localNotificationHelper = LocalNotificationHelper()

}
