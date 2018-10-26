import UIKit
import UserNotifications

class CustomerViewController: UIViewController, UIApplicationDelegate, UNUserNotificationCenterDelegate{
    
    var name: String
    var address: String
    var window: UIWindow?
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var addressTextField: UITextField!

    @IBAction func sendOrder(_ sender: Any) {
        
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            
            let center = UNUserNotificationCenter.current()
            center.delegate = self
            
            center.requestAuthorization(options: [.alert, .sound,]) { (granted, error) in
                if let error = error {
                    NSLog("There was an error requesting authorization for notifications: \(error)")
                    return
                }
                NSLog("Notifications authorization granted? \(granted)")
            }
            return true
        }
        func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
            print("The notification arrived.")
            completionHandler(.alert)
        
        }
        let content = UNMutableNotificationContent()
        content.title = "Delivery for \(name)!"
        content.body = "Your shopping items will be delivered to \(address) in 15 minsutes!"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
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
