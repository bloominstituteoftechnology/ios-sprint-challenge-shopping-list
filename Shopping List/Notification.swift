//
//  Notification.swift
//  Shopping List
//
//  Created by Lotanna Igwe-Odunze on 10/19/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import UserNotifications

class Notifier {
    
    func checkAuthorisation(completion: @escaping (UNAuthorizationStatus) -> Void) {
        UNUserNotificationCenter.current().getNotificationSettings { (settings) in
            DispatchQueue.main.async {
                completion(settings.authorizationStatus)
            }
        }
    }
    
    func requestAuthorisation(completion: @escaping (Bool) -> Void) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (success, error) in
            
            if let error = error { NSLog("Error requesting authorization status for local notifications: \(error)") }
            
            DispatchQueue.main.async {
                completion(success)
            }
        }
    }
    
    func notify(){
        let content = UNMutableNotificationContent()
        content.title = "Delivery Notification:"
        content.body = "Your order will be delivered in 15 minutes!"
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        let request = UNNotificationRequest(identifier: "orderReadyNotification", content: content, trigger: trigger)
        
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.add(request) { (error) in
            if let error = error{
                NSLog("\(error)")
                return
            }
        }
    }
}

