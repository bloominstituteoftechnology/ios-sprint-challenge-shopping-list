//
//  LocalNotificationHelper.swift
//  Memories
//
//  Created by Conner on 8/1/18.
//  Copyright © 2018 Conner. All rights reserved.
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

    func scheduleShoppingOrder(name: String, address: String) {
        let content = UNMutableNotificationContent()
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        content.body = "Your items will delivered to \(name) at \(address) in 15 minutes!"
        content.sound = UNNotificationSound.default()
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


