import UIKit
import UserNotifications

class CustomerViewController: UIViewController, UIApplicationDelegate, UNUserNotificationCenterDelegate{
    
    var name: String
    var address: String
    var window: UIWindow?
    
    init() {
        loadFromPersistence()
    }
    
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
    
    
    func createShoppingItem(name: String, image: UIImage(named:imageName), isAdded: Bool){
        let shoppingItem = ShoppingItem(name: name, image: image, isAdded: false)
        shoppingItems.append(shoppingItem)
        
        saveToPersistence()
    }
    
    func updateShoppingItem(shoppingItem: ShoppingItem, name:String, image: UIImage){
        shoppingItem.name = name
        shoppingItem.image = UIImage
        shoppingItem.isAdded = false
        
        saveToPersistence()
        
    }
    func deleteShoppingItem(index: Int){
        shoppingItems.isAdded = false
        
        saveToPersistence()
    }
    private func loadFromPersistence() {
        do {
            let shoppingItemsData = try Data(contentsOf: shoppingItemsFileURL)
            let decoder = JSONDecoder()
            let decodedShoppingItems = try decoder.decode([ShoppingItem].self, from: shoppingItemsData)
            
            shoppingItems = decodedShoppingItems
        } catch {
            NSLog("Error decoding shoppingItems: \(error)")
        }
    }
    
    private func saveToPersistence() {
        let encoder = JSONEncoder()
        
        do {
            let shoppingItemsData = try encoder.encode(shoppingItems)
            try shoppingItems.write(to: shoppingItemsFileURL)
        } catch {
            NSLog("Error encoding shoppingItems: \(error)")
        }
    }
    var memoriesFileURL = URL(fileURLWithPath: NSHomeDirectory())
        .appendingPathComponent("Documents")
        .appendingPathComponent("shoppingItems.json")
}
