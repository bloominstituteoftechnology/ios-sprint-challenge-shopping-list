//
//  LocalNotificationHelper.swift
//  Shopping List
//
//  Created by Samantha Gatt on 8/3/18.
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
    
    
    func sendNotification(name: String, address: String) {
        let content = UNMutableNotificationContent()
        content.title = "Delivery for \(name)!"
        content.body = "Your delivery will be shipped to \(address)"
        
        let sound = UNNotificationSound.default()
        content.sound = sound
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 7, repeats: false)
        let request = UNNotificationRequest(identifier: "NotificationID", content: content, trigger: trigger)
        
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.add(request) { (error) in
            if let error = error {
                NSLog("There was an error scheduling a notification: \(error)")
                return
            }
        }
    }
}
