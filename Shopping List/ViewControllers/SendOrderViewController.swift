//
//  SendOrderViewController.swift
//  Shopping List
//
//  Created by Lambda_School_Loaner_204 on 10/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit
import UserNotifications

class SendOrderViewController: UIViewController, UNUserNotificationCenterDelegate {

    // MARK: - IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    var shoppingListController: ShoppingListController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        updateViews()
        UNUserNotificationCenter.current().delegate = self
    }
    

    // MARK: - Class Functions
    func updateViews() {
        guard let shoppingListController = shoppingListController else { return }
        
        nameTextField.becomeFirstResponder()
        let shoppingListCount = shoppingListController.addedItems.count
        
        titleLabel.text = "You currently have \(shoppingListCount) item(s) in your shopping list."
    }
    
    private func showOrderAlert() {
        let alert = UIAlertController(title: "Order Submitted!", message: "\(nameTextField.text!) your order will be delivered in 15 minutes to \(addressTextField.text!).", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    private func userNoticationCenter() {

        let center = UNUserNotificationCenter.current()
        center.getNotificationSettings { settings in
            if settings.authorizationStatus == .notDetermined {
                center.requestAuthorization(options: [.alert, .sound]) { granted, error in
                    // Enable or disable features based on authorization.
                }
            }
            guard settings.authorizationStatus == .authorized else { return }

            if settings.alertSetting == .enabled {
                // Schedule an alert-only notification.
                self.presentOrderNotification()
            } else {
                // Schedule a notification with a badge and sound.
            }
        }

        

    }
    
    private func presentOrderNotification() {
        // Configure the notification's payload.
        let content = UNMutableNotificationContent()
        content.title = NSString.localizedUserNotificationString(forKey: "Order Submitted!", arguments: nil)
        content.body = NSString.localizedUserNotificationString(forKey: "\(nameTextField.text!) your order will be delivered in 15 minutes to \(addressTextField.text!).", arguments: nil)
        content.sound = UNNotificationSound.default()
        
        // Deliver the notification in five seconds.
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "FiveSecond", content: content, trigger: trigger) // Schedule the notification.
        let center = UNUserNotificationCenter.current()
        center.add(request) { (error : Error?) in
            if let _ = error {
                // Handle any errors
            }
        }
    }

    // MARK: - IBActions
    
    @IBAction func sendOrderTapped(_ sender: UIButton) {
        guard let nameText = nameTextField.text,
            let addressText = addressTextField.text,
            !nameText.isEmpty,
            !addressText.isEmpty else { return }
        
        showOrderAlert()
        userNoticationCenter()
    
    }

}
