import Foundation
import UserNotifications
//test
class LocalNotificationHelper {
    
    func getAuthorizationStatus(completion: @escaping (UNAuthorizationStatus) -> Void) {
        UNUserNotificationCenter.current().getNotificationSettings { (settings) in
            DispatchQueue.main.async {
                completion(settings.authorizationStatus)
            }
        }
    }
    
    func requestAuthorization(completion: @escaping (Bool) -> Void) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound])
        { (success, error) in
            if let error = error { NSLog("Error requesting authorization status for local notifications: \(error)") }
            DispatchQueue.main.async {
                completion(success)
            }
        }
    }
    
    func scheduleNotification(name: String, address: String) {
        let content = UNMutableNotificationContent()
        content.title = "Delivery for \(name)!"
        content.body = "Your order will arrive at \(address) in 15 minutes"
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
