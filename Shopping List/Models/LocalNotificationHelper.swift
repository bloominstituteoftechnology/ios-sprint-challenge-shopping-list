//
//  LocalNotificationHelper.swift
//  Shopping List
//
//  Created by David Oliver Doswell on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import UserNotifications

class LocalNotificationHelper {
    
    // helper methods for requesting and getting authorization
    func getAuthorizationStatus(completion: @escaping (UNAuthorizationStatus) -> Void) {
        UNUserNotificationCenter.current().getNotificationSettings { (settings) in
            DispatchQueue.main.async {
                completion(settings.authorizationStatus)
            }
        }
    }
    
    func requestAuthorization(completion: @escaping (Bool) -> Void) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (success, error) in
            
            if let error = error {
                NSLog("Error requesting authorization status for local notifications: \(error)") }
            
            DispatchQueue.main.async {
                completion(success)
            }
        }
    }
    
    
    // set up a local notification to fire every day at 8 PM
    
    func scheduleDailyReminderNotification() {
        
        var date = DateComponents()
        date.second = 5
        
        let content = UNMutableNotificationContent()
        content.body = "Hi, Alice. Your delivery will be there in 15 minutes!"
        content.sound = .default()
        content.subtitle = "Thank you"
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: true)
        
        let request = UNNotificationRequest(identifier: .notification, content: content, trigger: trigger)
        
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.add(request) { (error) in
            if let error = error {
                NSLog("Error scheduling notification \(error)")
                return
            }
        }
    }
}


