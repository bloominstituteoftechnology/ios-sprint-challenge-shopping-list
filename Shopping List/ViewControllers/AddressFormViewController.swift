//
//  AddressFormViewController.swift
//  Shopping List
//
//  Created by Carolyn Lea on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit
import UserNotifications

class AddressFormViewController: UIViewController
{
    @IBOutlet weak var promptAndItemCountLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    var shoppingItemController = ShoppingItemController()
    var shoppingOrderController = ShoppingOrderController()
    let localNotificationHelper = LocalNotificationHelper()
    var itemCount: Int = 0
    
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(true)
        updateViews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        localNotificationHelper.getAuthorizationStatus{ (status) in
            if status == .authorized
            {
                NSLog("notifications authorized")
                
            }
        }
    }

    @IBAction func sendOrder(_ sender: Any)
    {
        guard let name = nameTextField.text,
            let address = addressTextField.text else {return}
        shoppingOrderController.createOrder(name: name, address: address)
        localNotificationHelper.requestAuthorization { (success) in
            self.scheduleDailyReminderNotification()
        }
        navigationController?.popViewController(animated: true)
    
    }
    
    func updateViews()
    {
        promptAndItemCountLabel.text = "You currently have \(itemCount) item(s) in your shopping list."
    }
    
    func scheduleDailyReminderNotification()
    {
        guard let name = nameTextField.text,
            let address = addressTextField.text else {return}
        let content = UNMutableNotificationContent()
        content.title = "Delivery for \(name)!"
        content.body = "Your shopping items will be delivered to \(address) in 15 minutes!"
        content.sound = UNNotificationSound.default()
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        
        let request = UNNotificationRequest(identifier: "DeliveryNotification", content: content, trigger: trigger)
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.add(request) { (error) in
            if let error = error
            {
                NSLog("There was an error \(error)")
                return
            }
        }
    }
    
}
