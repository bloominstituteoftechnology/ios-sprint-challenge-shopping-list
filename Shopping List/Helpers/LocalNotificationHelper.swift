//
//  LocalNotificationHelper.swift
//  Shopping List
//
//  Created by Paul Yi on 1/25/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UserNotifications

class LocalNotificationHelper {
    var shoppingItemController: ShoppingItemController?
    
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
    
    func scheduleDailyReminderNotification(name: String, address: String) {
        
        let content = UNMutableNotificationContent()
        content.title = "Delivery for \(name)!"
        content.body = "Your shopping items will be delivered to \(address) in 15 minutes."
        content.sound = UNNotificationSound.default()
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let uuidString = UUID().uuidString
        
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.add(request) { (error) in
            if let error = error {
                NSLog("There was an error scheduleing a notification: \(error)")
                return
            }
        }
    }
}
