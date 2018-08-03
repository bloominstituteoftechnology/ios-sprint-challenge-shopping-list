//
//  DetailsViewController.swift
//  Shopping List
//
//  Created by Vuk Radosavljevic on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit
import UserNotifications

class DetailsViewController: UIViewController {
    
    //MARK: - OVERRIDES
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let items = shoppingItemController?.itemsThatAreAdded else {return}
        descriptionLabel.text = "You currently have \(items) item(s) in your shopping list."
    }
    
    //MARK: - PROPERTIES
    var shoppingItemController: ShoppingItemController? 
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    let localNotificationHelper = LocalNotificationHelper()

    //MARK: - METHODS
    @IBAction func sendOrderButtonPressed(_ sender: Any) {
        localNotificationHelper.requestAuthorization { (true) in
            self.sendNotification()
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func sendNotification() {
        guard let name = nameTextField.text,
            let address = addressTextField.text else {return}
        
        let content = UNMutableNotificationContent()
        content.title = "Delivery for \(name)"
        content.body = "Your shopping items will be delivered to \(address) in 15 minutes!"
        content.sound = UNNotificationSound.default()
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "Notification", content: content, trigger: trigger)
        
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.add(request) { (error) in
            if let error = error {
                NSLog("There was an error \(error)")
                return
            }
        }
    }
}
