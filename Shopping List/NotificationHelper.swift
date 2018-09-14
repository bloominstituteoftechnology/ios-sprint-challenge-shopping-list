//
//  NotificationHelper.swift
//  Shopping List
//
//  Created by Ilgar Ilyasov on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import UserNotifications

class NotificationHelper {
    
    // MARK: - Get authorization status
    
    func getAuthorizationStatus(completion: @escaping (UNAuthorizationStatus) -> Void) {
        UNUserNotificationCenter.current().getNotificationSettings { (settings) in
            DispatchQueue.main.async {
                completion(settings.authorizationStatus)
            }
        }
    }
    
    // MARK: - Request authorization
    
    func requestAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if let error = error {
                NSLog("Error reuestinh local notification Authorization: \(error)")
            }
            
            if granted {
                print("Local notifocation permission ACCESS GRANTED!")
            } else {
                print("Local notification permission DENIED!")
            }
        }
    }
    
    // MARK: - Schedule notification
    
    func scheduleNotification(customerName: String, customerAddress: String) {
        getAuthorizationStatus { (status) in
            if status == .authorized {
                let identifier = "DailyNotification"
                
                let content = UNMutableNotificationContent()
                content.title = "Delivery for \(customerName)!"
                content.body = "Your shopping will be delivered to \(customerAddress) in 15 minutes"
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
                
                let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
                
                UNUserNotificationCenter.current().add(request) { (error) in
                    if let error = error {
                        NSLog("Daily notification error: \(error)")
                    }
                }
            }
        }
    }
}
