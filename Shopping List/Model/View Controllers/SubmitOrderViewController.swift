import UIKit
import UserNotifications

class SubmitOrderViewController: UIViewController{
    
    @IBAction func submitOrder(_ sender: Any) {
        let content = UNMutableNotificationContent()
        content.title = "Groceries are coming."
        content.body = "Approximate arrival time is 15 minutes."
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "NotificationID", content: content, trigger: trigger)
        let notificationCenter = UNUserNotificationCenter.current()
        
        notificationCenter.add(request) { (error ) in
            if let error = error {
                NSLog("There was an error scheduling a notification: \(error)")
                return
            }
        }
    }
    var shoppingItemController: ShoppingItemController?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? SubmitOrderViewController else {return}
        destination.shoppingItemController = shoppingItemController
    }
    
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

        
    
    

   

