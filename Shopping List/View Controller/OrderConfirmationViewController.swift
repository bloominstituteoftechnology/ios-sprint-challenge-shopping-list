//
//  OrderConfirmationViewController.swift
//  Shopping List
//
//  Created by Madison Waters on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit
import UserNotifications

class OrderConfirmationViewController: UIViewController  {// UNUserNotificationCenterDelegate

    var shoppingController: ShoppingItemController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let center = UNUserNotificationCenter.current()
        //center.delegate = self
        
        updateViews()
    }
    
    @IBOutlet weak var shoppingCartItemsLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    @IBAction func sendOrderNotification(_ sender: Any) {
        
        guard let name = nameTextField.text,
            let address = addressTextField.text else { return }
        
        guard let items = shoppingController?.orderedItems.count else { return }
        
        let alert = UIAlertController(title: "Delivery for \(name)", message: "Your order of \(items) items will be delivered to \(address)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
        
        //requestAuth();
        //setNotificationProperties();
    }
    
    private func updateViews() {
        guard let items = shoppingController?.orderedItems.count else { return }
        shoppingCartItemsLabel.text  = "You have \(items) items in your cart"
    }
    
//    func checkNotificationAuthorizationStatus() {
//        UNUserNotificationCenter.current().getNotificationSettings { (settings) in
//            switch settings.authorizationStatus {
//            case .denied: break
//
//            default:
//                break
//            }
//        }
//    }
//
//    func requestAuth() {
//        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
//            if let error = error {
//                NSLog("Error requesting local notification Authorization: \(error)")
//            }
//
//            if granted {
//                print("Local Authorization Permission Access Granted")
//            } else {
//                print("Local Authorization Permission Denied")
//            }
//        }
//    }
//
//    func setNotificationProperties() {
//        // Unique Identifier
//        let indentifier = "DailyReminder"
//
//        guard let customerName = nameTextField.text,
//            let customerAddress = addressTextField.text else { return }
//
//        let customerInfo = "To: \(customerName) \n At: \(customerAddress)"
//
//        // When action fires info should be injected from the textfields
//        let content = UNMutableNotificationContent()
//        guard let items = shoppingController?.orderedItems.map({$0.wasAdded == true}).count else { return }
//        content.title = "\(items) items in your shopping basket"
//        content.subtitle = "Please allow 15 min for delivery."
//        content.body = customerInfo
//
//        content.badge = 1 // should return items in shopping cart
//
//        // When the notification gets shown
//        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
//
//        // The notification
//        let request = UNNotificationRequest(identifier: indentifier, content: content, trigger: trigger)
//        UNUserNotificationCenter.current().add(request) { (error) in
//            if let error = error {
//                NSLog("Error adding Notification \(error)")
//            }
//        }
//    }
//
//    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
//        completionHandler([.alert, .sound])
//    }
//
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
