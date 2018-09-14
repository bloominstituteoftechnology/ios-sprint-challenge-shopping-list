//
//  UserInfoViewController.swift
//  Shopping List
//
//  Created by Scott Bennett on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit
import UserNotifications

class UserInfoViewController: UIViewController {
    
    @IBOutlet weak var itemsInOrderLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func sendOrderButton(_ sender: Any) {
        
        let center = UNUserNotificationCenter.current()
        // Request permission to display alerts and play sounds.
        center.requestAuthorization(options: [.alert, .sound])
        { (granted, error) in
            if let error = error {
                NSLog("There was an error requesting authorization for notification: \(error)")
                return
            }
            
            NSLog("Notifiation authorization granted? \(granted)")
        }
        
        
        guard let name = nameTextField.text,
            let address = addressTextField.text else { return }
        
        let content = UNMutableNotificationContent()
        content.title = "Delivery for \(name)!"
        content.body = "Your shopping list will be delivered to \(address) in 15 minutes"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "ShoppingListID", content: content, trigger: trigger)
        
        // Schedule the request with the system.
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.add(request) { (error) in
            if let error = error {
                NSLog("There was an error schedluling a notification: \(error)")
                return
            }
        }
        
    }
    
}
