//
//  LocalNotificationHelper.swift
//  Shopping List
//
//  Created by Nikita Thomas on 10/19/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit
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
    
    func scheduleNotification(name: String, address: String) {
        let content = UNMutableNotificationContent()
        content.title = "Delivery for \(name)!"
        content.body = "Your order will be ariving to \(address) in 12 minutes :)"
        
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        let center = UNUserNotificationCenter.current()
        center.add(request) { error in
            if let error = error {
                NSLog("Error scheduling notification: \(error)")
                return
            }
        }
    }
}
