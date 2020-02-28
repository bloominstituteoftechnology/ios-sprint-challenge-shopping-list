//
//  Notify.swift
//  Shopping List
//
//  Created by Lydia Zhang on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import UserNotifications
class Notify {
    func setNotify() {
        let content = UNMutableNotificationContent()
        content.title = "Notification:"
        content.body = " "
        let interval = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "PlaceOrderNotify", content: content, trigger: interval)
        
        let notify = UNUserNotificationCenter.current()
        notify.add(request, withCompletionHandler: nil)
    }
}
