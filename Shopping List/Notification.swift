//
//  Notification.swift
//  Shopping List
//
//  Created by Lotanna Igwe-Odunze on 10/19/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications

class Notifier: NSObject, UNUserNotificationCenterDelegate {
    
    //Find out if we've been granted permission already
    func checkAuthorisation(completion: @escaping (UNAuthorizationStatus) -> Void) {
        UNUserNotificationCenter.current().getNotificationSettings { (settings) in
            DispatchQueue.main.async {
                completion(settings.authorizationStatus)
            }
        }
    }
    
    //Get Authorisation to make the notification
    func AskPermission(completion: @escaping (Bool) -> Void ) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (success, error) in
            if let error = error { NSLog("Error requesting authorization status for local notifications: \(error)") }
            
            DispatchQueue.main.async {
                completion(success)
            }
        }
    }
    
    //Make the Notification
    func Notify(name: String, address: String, itemCount: Int) {
        
        let notice = UNMutableNotificationContent()
        notice.title = "Delivery Notification"
        notice.body = "Hey, \(name)! Your \(itemCount) items will be delivered to \(address) in 15 minutes!"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: notice, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
}

