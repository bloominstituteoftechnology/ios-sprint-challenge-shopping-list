import UIKit
import UserNotifications

class SubmitOrderViewController: UIViewController, UNUserNotificationCenterDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
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

        
    }
    

   
}
