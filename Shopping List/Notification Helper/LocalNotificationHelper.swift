//
//  LocalNotificationHelper.swift
//  Shopping List
//
//  Created by Welinkton on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import UserNotifications

class LocalNotificationHelper: NSObject, UNUserNotificationCenterDelegate {
    
    // Getting Authorization
    func getAuthorizationStatus(completion: @escaping (UNAuthorizationStatus) -> Void) {
        UNUserNotificationCenter.current().getNotificationSettings { (settings) in
            DispatchQueue.main.async {
                completion(settings.authorizationStatus)
            }
        }
    }
    
   
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .sound])
    }

    
    func scheduleDailyReminderNotification(name: String, address:String) {
        
                // Configuring the Notification contents
                let content = UNMutableNotificationContent()
                content.title = "There is a delivery for \(name)"
                content.body = "Congratulations!! Your shipping items will be delivered to \(address) in about 15 minutes!"
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
        
                let request = UNNotificationRequest(identifier: "Delivery", content: content, trigger: trigger)
        
                // Schedule the request with the system.
                let notificationCenter = UNUserNotificationCenter.current()
                notificationCenter.add(request) { (error) in
                    if let error = error {
                        // Handle any errors.
                        NSLog("There seems to be an error: \(error)")
                    }
                }
            }
        }

    
    
    
    // Requesting Authorization
    func requestAuthorization(completion: @escaping (Bool) -> Void) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (success, error) in
            
            if let error = error { NSLog("Error requesting authorization status for local notifications: \(error)") }
            
            DispatchQueue.main.async {
                completion(success)
            }
        }
    }



