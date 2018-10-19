import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        checkNotificationAuthorization()
        return true
        
    }
    func checkNotificationAuthorization() {
        //see whether the user has already granted permission
        // and if not, start request process
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        
        center.getNotificationSettings { settings in
            guard settings.notificationCenterSetting != .enabled else {
                NSLog("location notifications has been granted")
                return
            }
            
            // Handle ungranted notification permissions
            self.requestNotificationAuthorization()
        }
    }
    
    func requestNotificationAuthorization() {
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .sound]) { granted, error in
            
            if let error = error {
                NSLog("Error requestion notification authorization: \(error)")
                
                return
            }
            NSLog("notification authorization status: \(granted ? "granted" : "notgranted")")
            
            guard !granted else {return}
            
            let alertController = UIAlertController(
                title: "Authorization not granted",
                message: "This app cannot present notifications without your explicit consent",
                preferredStyle: .alert)
            
            let okayAction = UIAlertAction(title: "Understood", style: .default, handler: nil)
            let settingsAction = UIAlertAction(title: "Open Settings", style: .default, handler: { action in
                guard let url = URL(string: UIApplication.openSettingsURLString) else {
                    fatalError("Application-supplied openSettingsURLString failed to create cromulent URL")
                }
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            })
            
            alertController.addAction(okayAction)
            alertController.addAction(settingsAction)
            
            self.window?.rootViewController?.present(alertController, animated: true, completion: nil)
            
        }
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        NSLog("Will present notification: \(notification)")
        completionHandler(.alert)
    }
}

