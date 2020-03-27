//
//  OrderViewController.swift
//  Shopping List
//
//  Created by Karen Rodriguez on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit
import UserNotifications

class OrderViewController: UIViewController {

    @IBOutlet weak var listSizeLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressField: UITextField!
    
    var itemController: ShoppingItemController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        
    }
    
    
    @IBAction func orderButton(_ sender: Any) {
        guard let name = nameTextField.text,
            let address = addressField.text,
            !name.isEmpty,
            !address.isEmpty else {return}
        
        let content = UNUserNotificationCenter.current()
        
        content.requestAuthorization(options: .alert) {(granted, error) in }
        scheduleNotification()
        print("We got down here")
        
        
    }
    
    func updateView() {
        guard let itemController = itemController else {return}
        listSizeLabel.text = "You currently have \(itemController.addedItems.count) in your shopping list."
    }
    
    

    func scheduleNotification() {
        let center = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        content.title = "Delivery for \(nameTextField.text!)"
        content.body = "Your shopping items will be delivered to \(addressField.text!)"
        content.categoryIdentifier = "alarm"
        content.userInfo = ["customData": "fizzbuzz"]
        content.sound = UNNotificationSound.default()
        
        var dateComponents = DateComponents()
        dateComponents.hour = 10
        dateComponents.minute = 30
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 6, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        center.add(request)
    }
    
    
}
