//
//  LocalNotificationHelper.swift
//  Shopping List
//
//  Created by admin on 9/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
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
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) {
            (success, error) in
            if let error = error { NSLog("Error requesting authorization status for local notifications: \(error)") }
            DispatchQueue.main.async {
                completion(success)
            }
        }
    }
    
    func scheduleOrderDeliveryNotification(withName name: String, andAddress address: String) {
        let identifier = "OrderDeliveryNotification"
        let content = UNMutableNotificationContent()
        content.title = "Delifvery for \(name)!"
        content.body = "Your shopping items will be deliverd to \(address) in 15 minutes!"
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
    UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [identifier])
        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error { NSLog("error adding daily reminder notification: \(error)")}
        }
    }
}
