//
//  LocalNotificationHelper.swift
//  Shopping List
//
//  Created by Lisa Sampson on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UserNotifications

class LocalNotificationHelper: NSObject, UNUserNotificationCenterDelegate {
    
    // MARK: - Properties
    var shoppingController: ShoppingItemController?
    
    // MARK: - Local Notification Methods
    
    func getAuthorizationStatus(completion: @escaping (UNAuthorizationStatus) -> Void) {
        
        UNUserNotificationCenter.current().getNotificationSettings { (settings) in
            DispatchQueue.main.async {
                completion(settings.authorizationStatus)
            }
        }
    }
    
    func requestAuthorizationStatus(completion: @escaping (Bool) -> Void) {
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (success, error) in
            
            if let error = error {
                NSLog("Error requesting authorization status for local notifications: \(error)")
            }
            
            DispatchQueue.main.async {
                completion(success)
            }
        }
    }
    
    func scheduleDailyReminderNotification(name: String, address: String) {
        
        let content = UNMutableNotificationContent()
        content.title = "Delivery For \(name)"
        content.body = "Your order will be delivered to \(address) in 15 mintutes."
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "ShoppingIdentifier", content: content, trigger: trigger)
        let center = UNUserNotificationCenter.current()
        
        center.delegate = self
        
        center.add(request) { (error) in
            if let error = error {
                print("There was an error scheduling a notification: \(error)")
                return
            }
        }
    }
}
