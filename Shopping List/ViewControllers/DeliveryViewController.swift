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
        if deliveryController.deliveries.first != nil {
            nameTextField.text = deliveryController.deliveries.first?.name
            addressLine1TextField.text = deliveryController.deliveries.first?.addressLineOne
            addressLine2TextField.text = deliveryController.deliveries.first?.addressLineTwo
            cityTextField.text = deliveryController.deliveries.first?.city
            stateTextField.text = deliveryController.deliveries.first?.state
            zipCodeTextField.text = deliveryController.deliveries.first?.zipCode
        }
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
        // save delivery address
        guard let name = nameTextField.text,
            let address1 = addressLine1TextField.text,
            let address2 = addressLine2TextField.text,
            let city = cityTextField.text,
            let state = stateTextField.text,
            let zip = zipCodeTextField.text else { return }
        deliveryController.savecurrentDeliveryAddress(name: name, addressLineOne: address1, addressLineTwo: address2, city: city, state: state, zipCode: zip)
        
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
    let deliveryController = DeliveryController()

}
