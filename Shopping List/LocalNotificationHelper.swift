//
//  LocalNotificationHelper.swift
//  Shopping List
//
//  Created by Moin Uddin on 9/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import UserNotifications

class LocalNotificationHelper {
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
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        //This is called right before the notifcation gets shown to the user.
        
        //Calling this will show the alert in the app.
        completionHandler([.alert])
    }
    
    func sendOrderNotification(name: String, address: String) {
        //let identifier = "SendingOrder"
        
        let content = UNMutableNotificationContent()
        content.title = "Delivery for \(name)"
        content.body = "Your order will be sent to \(address) in 15 minutes"

        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let request = UNNotificationRequest(identifier: "notifydelivery", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) {error in
            if let error = error {
                NSLog("There was an error scheduling a notification: \(error)")
                return
            }
            
        }
        
    }
}
