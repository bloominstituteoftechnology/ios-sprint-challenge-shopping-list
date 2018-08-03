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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // Display shopping list items
    func displayAddedItems() {
        var string = ""
        guard let items = shoppingController?.shoppingItems else { return }
        for item in items {
            let prettyItem = "\(item.name)\n"
            string.append(prettyItem)
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
        content.title = "Your deliver is on its way"
        content.body = "Your shopping will be delivered to your address in 15 minutes: \(addressLine1TextField.text ?? "" ), \(addressLine2TextField.text ?? "" ), \(cityTextField.text ?? "" ), \(stateTextField.text ?? "" ), \(zipCodeTextField.text ?? "" )"
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false)
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.add(request)
    }
    
    
    // Button functions
    
    @IBAction func scheduleDelivery(_ sender: Any) {
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
