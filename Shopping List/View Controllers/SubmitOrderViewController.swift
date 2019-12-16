//
//  SubmitOrderViewController.swift
//  Shopping List
//
//  Created by Joshua Rutkowski on 12/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit
import UserNotifications

class SubmitOrderViewController: UIViewController, UNUserNotificationCenterDelegate {
    var messageSubtitle = "Shopping List"
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var itemsLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    var itemCount: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        UNUserNotificationCenter.current().requestAuthorization(options:
            [[.alert, .sound, .badge]],
                completionHandler: { (granted, error) in
            // Handle Error
        })
        UNUserNotificationCenter.current().delegate = self
    }
    
        func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {

        completionHandler([.alert, .sound])
    }
    
    private func updateViews() {
        guard let itemCount = itemCount else { return }
        
        itemsLabel.text = "You have \(itemCount) item(s) in your shopping list."
    }
    
//    private func sendAlert(to name: String, at address: String) {
////
////        let title = "Delivery for \(name)!"
////        let message = "Your items will be delivered to \(address) in 15 minutes."
////
////        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
////
////
////        let action = UIAlertAction(title: "Ok", style: .default) { alert in self.navigationController?.popToRootViewController(animated: true)}
////        alert.addAction(action)
////
////        present(alert, animated: true)
//    }
    
    func sendNotification() {
        let name = nameTextField.text
        let address = addressTextField.text
        
        let content = UNMutableNotificationContent()
        content.title = "Delivery for \(name ?? "unknown")!"
        content.subtitle = messageSubtitle
        content.body = "Your items will be delivered to \(address ?? "unknown") in 15 minutes."
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3,
                repeats: false)
        let requestIdentifier = "demoNotification"
        let request = UNNotificationRequest(identifier: requestIdentifier,
                content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request,
            withCompletionHandler: { (error) in
                // Handle error
    })
}
    
    // MARK: - IBActions
    
    @IBAction func submitOrderButton(_ sender: Any) {
//        guard let name = nameTextField.text, let address = addressTextField.text, !name.isEmpty, !address.isEmpty else { return }
//        sendAlert(to: name, at: address)
        sendNotification()
    }
    
}
