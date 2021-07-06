//
//  ShoppingAlert.swift
//  Shopping List
//
//  Created by Mitchell Budge on 5/5/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit
import UserNotifications

class ShoppingAlert {
    //Failed attempt at stretch goal
    
    /*func createAlert (title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Your order will be delivered to your address in 15 minutes", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }*/
}

/*func checkAuthorization(completion: @escaping (UNAuthorizationStatus) -> Void) {
 //this closure is a function that is going to return some settings
 UNUserNotificationCenter.current().getNotificationSettings { (settings) in
 completion(settings.authorizationStatus)
 }
 }
 func requestAuthorization(completion: @escaping (Bool) -> Void) {
 UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (response, error) in
 // this will find out if we have permission, and if there is an error, it will print out in the debugger
 if let authorizationError = error {
 NSLog(authorizationError as! String)
 }
 // this is what we'll do if we get a response back
 completion(response)
 }
 }
 func makeNotification() {
 let notification = UNMutableNotificationContent()
 notification.title = "Delivery for \(shoppingDVC?.nameTextField.text)"
 notification.body = "Your shopping items will be delivered to \(shoppingDVC?.addressTextField.text) in 15 minutes"
 let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
 let request = UNNotificationRequest(identifier: "shoppingRequest", content: notification, trigger: trigger)
 
 UNUserNotificationCenter.current().add(request) { (error) in
 if let notificationError = error {
 NSLog(notificationError as! String)
 return
 }
 }
 }*/

