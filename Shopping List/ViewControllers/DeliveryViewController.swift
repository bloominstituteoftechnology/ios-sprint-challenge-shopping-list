//
//  DeliveryViewController.swift
//  Shopping List
//
//  Created by Jonathan T. Miles on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit
import UserNotifications

class DeliveryViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        displayAddedItems()
    }
    
    // Display shopping list items
    func displayAddedItems() {
        var string = ""
        guard let items = shoppingController?.shoppingItems else { return }
        for item in items {
            if item.addedToList == true {
                let prettyItem = "\(item.name)\n"
                string.append(prettyItem)
            }
        }
        shoppingListTextView.text = string
    }
    
    // MARK: - Notifications
    
    // gets authorization from the user to receive notifications (boilerplate)
    func getAuthorizationStatus(completion: @escaping (UNAuthorizationStatus) -> Void) {
        UNUserNotificationCenter.current().getNotificationSettings { (settings) in
            DispatchQueue.main.async {
                completion(settings.authorizationStatus)
            }
        }
    }
    
    func requestAuthorization(completion: @escaping (Bool) -> Void) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (success, error) in
            
            if let error = error { NSLog("Error requesting authorization status for local notifications: \(error)") }
            
            DispatchQueue.main.async {
                completion(success)
            }
        }
    }
    
    func scheduleNotification() {
        let identifier = UUID().uuidString
        let content = UNMutableNotificationContent()
        content.title = "Your delivery is on its way"
        content.body = "Your shopping will be delivered to your address in 15 minutes: \(nameTextField.text ?? "" ), \(addressLine1TextField.text ?? "" ), \(addressLine2TextField.text ?? "" ), \(cityTextField.text ?? "" ), \(stateTextField.text ?? "" ), \(zipCodeTextField.text ?? "" )"
        let sound = UNNotificationSound.default()
        content.sound = sound
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false)
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.add(request)
    }
    
    
    // MARK: - Button functions
    
    @IBAction func scheduleDelivery(_ sender: Any) {
        self.requestAuthorization() { (success) in
            self.scheduleNotification()
        }
    }
    
    // Outlets
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressLine1TextField: UITextField!
    @IBOutlet weak var addressLine2TextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var zipCodeTextField: UITextField!
    
    @IBOutlet weak var shoppingListTextView: UITextView!
    
    // Passed properties
    var shoppingController: ShoppingController?

}
