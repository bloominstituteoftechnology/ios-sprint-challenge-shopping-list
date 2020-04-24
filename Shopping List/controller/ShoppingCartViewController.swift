//
//  ShoppingCartViewController.swift
//  Shopping List
//
//  Created by Vincent Hoang on 4/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit
import UserNotifications

class ShoppingCartViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var messageLabel: UILabel?
    @IBOutlet var nameTextField: UITextField?
    @IBOutlet var addressTextField: UITextField?
    @IBOutlet var sendOrderButton: UIButton?
    
    var controller: ShoppingListController?
    
    override func viewDidLoad() {
        let numItems = controller?.shoppingList.filter({ $0.isAddedToShoppingList }).count
        messageLabel?.text = "You currently have \(numItems ?? 0) item(s) in your shopping list."
    }
    
    @IBAction func sendOrderPressed(_ sender: UIButton) {
        notificationSetup()
    }
    
    
    func notificationSetup() {
        if let unwrappedName = nameTextField?.text, let unwrappedAddress = addressTextField?.text {
        
        let options: UNAuthorizationOptions = [.alert, .sound]
            
        let center = UNUserNotificationCenter.current()
            
            center.requestAuthorization(options: options) {
              (granted, error) in
                if !granted {
                    print("Something went wrong")
                }
            }
            
            center.getNotificationSettings{ (settings) in if settings.authorizationStatus != .authorized {
                    print("Notifications not allowed")
                }
            }
        
        let content = UNMutableNotificationContent()
        content.title = "Delivery for \(unwrappedName)"
        content.body = "Your shopping items will be delivered to \(unwrappedAddress) in 15 minutes!"
        content.sound = UNNotificationSound.default()
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 15, repeats: false)
        
        let action = UNNotificationAction(identifier: "done", title: "Done", options: [.destructive])
    
        let category = UNNotificationCategory(identifier: "Delivery", actions: [action], intentIdentifiers: [], options: [])
        
        center.setNotificationCategories([category])
        
        content.categoryIdentifier = "Delivery"
            
        let request = UNNotificationRequest(identifier: "LocalNotification", content: content, trigger: trigger)
            center.add(request, withCompletionHandler: nil)
            
        }
    
        
        let alert = UIAlertController(title: "Success", message: "Delivery Scheduled.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Done", style: .cancel, handler: { action in self.dismiss(animated: true, completion: nil)} ))
        
        present(alert, animated: true)
    }
}
