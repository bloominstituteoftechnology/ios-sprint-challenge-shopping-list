//
//  ShoppingDetailViewController.swift
//  Shopping List
//
//  Created by Farhan on 9/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit
import UserNotifications

class ShoppingDetailViewController: UIViewController, UNUserNotificationCenterDelegate {
    
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var addressField: UITextField!
    
    var shoppingItemController: ShoppingItemController?
    
    let localNotificationHelper = LocalNotifHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.darkGray
        let count = shoppingItemController?.areSelected()
        counterLabel.text = "\(count ?? 1) Item(s) selected"

    }
    
    @IBAction func confirmOrder(_ sender: Any) {
        
        let center  = UNUserNotificationCenter.current()
        center.delegate = self
        center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            
            if let error = error {
                NSLog("Error requesting auth for notifcations: \(error)")
                return
            }
            
            if granted {
                
                DispatchQueue.main.async {
                    guard let name = self.nameField.text, let address = self.addressField.text else {return}
                    
                    self.scheduleOrderNotification(with: center, name: name, and: address)
                    self.navigationController?.popViewController(animated: true)
                }
                
                
            }
        }
    }
    
    private func scheduleOrderNotification (with center: UNUserNotificationCenter, name:String, and address: String){
        
        // Notification Setup
        let identifier = "OrderNotification"
        let content = UNMutableNotificationContent()
        content.title = "Order Confirmation for \(name)"
        content.body = "Your shopping list has been ordered to \(address) in 15 minutes."
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        center.add(request, withCompletionHandler: nil)
        
    }
    
}
