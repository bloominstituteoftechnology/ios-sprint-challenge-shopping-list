import UIKit

class CustomerViewController: UIViewController, UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate{
    
    var window: UIWindow?
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var addressTextField: UITextField!

    @IBAction func sendOrder(_ sender: Any) {
        
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            
            let center = UNUserNotificationCenter.current()
            center.delegate = self
            
            //request permission
            center.requestAuthorization(options: [.alert, .sound, .badges]) { (granted, error) in
                if let error = error {
                    NSLog("There was an error requesting authorization for notifications: \(error)")
                    return
                }
                
                NSLog("Notifications authorization granted? \(granted)")
            }
            
            
            return true
        }
        
        
    }
    

}
