//
//  File.swift
//  Shopping List
//
//  Created by scott harris on 1/31/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import UserNotifications

class NotificationCenter {
    
    let notificationCenter = UNUserNotificationCenter.current()
    
    static let sharedNotificationCenter = NotificationCenter()
    
    private func requestAuth() {
        notificationCenter.requestAuthorization(options: [.alert, .sound], completionHandler: {granted, error in
            if let error = error {
                print("Error requesting authorization: \(error.localizedDescription)")
            }
        })
    }
    
    func sendNotification(title: String, message: String, at interval: TimeInterval = 10) {
        requestAuth()
        
        notificationCenter.getNotificationSettings { [weak self] (settings) in
            guard settings.authorizationStatus == .authorized else { return }
            
            if settings.alertSetting == .enabled {
                self?.buildNotification(title: title, body: message, interval: interval)
            }
            
        }
    }
    
    private func buildNotification(title: String, body: String, interval: TimeInterval) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        
        // Create the trigger.
       let trigger = UNTimeIntervalNotificationTrigger(timeInterval: interval, repeats: false)

        
        // Create the request
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString,
                                            content: content, trigger: trigger)
        
        // Schedule the request with the system.
        notificationCenter.add(request) { (error) in
            if let error = error {
                // Handle any errors.
                print("Error Scheduling Notification: \(error.localizedDescription)")
            }
        }
        
    }
    
}
