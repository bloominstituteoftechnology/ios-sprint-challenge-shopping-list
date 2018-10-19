import UIKit
import UserNotifications

class OrderItemsViewController: UIViewController, UNUserNotificationCenterDelegate {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        
        updateViews()
        
        localNotificationHelper.getAuthorizationStatus { (status) in
            if status != .authorized {
                self.localNotificationHelper.requestAuthorization { (wasSuccessful) in
                    if !wasSuccessful {

                        let alert = UIAlertController(title: "We cannot send you shipment notifications currently",
                                                      message: "Turn on notifications to be able to receive order updates",
                                                      preferredStyle: .alert)
                        
                        let goToAction = UIAlertAction(title: "Show Settings", style: .default) { (action) in
                            if let url = URL(string: "app-settings:") {
                                UIApplication.shared.open(url, options: convertToUIApplicationOpenExternalURLOptionsKeyDictionary([:]), completionHandler: nil)
                            }
                        }
                        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) in }
                        alert.addAction(goToAction)
                        alert.addAction(cancel)
                        self.present(alert, animated: true, completion: nil)
                    }
                }
            }
        }
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        completionHandler([.alert, .badge])
    }
    
    private func updateViews() {
        billingAddressTextView.tintColor = .orange
        
        guard let shoppingItemController = shoppingItemController else { return }
        
        var shoppingList = Array(shoppingItemController.addedItems)
        
        if shoppingList.count > 1 {
            let endIndex = shoppingList.endIndex - 1
            shoppingList.remove(at: endIndex)
            
            var shoppingListString = ""
            for item in shoppingList {
                shoppingListString.append("\(item.name), ")
            }
            shoppingListString.append("\(shoppingItemController.addedItems[endIndex].name)")
            
            shoppingCartListLabel.text = shoppingListString
            title = "Ordering \(shoppingItemController.addedItems.count) items"
        } else {
            shoppingCartListLabel.text = shoppingItemController.addedItems.first?.name ?? ""
            title = "Ordering 1 item"
        }
    }
    
    @IBAction func sendOrder(_ sender: Any) {
        guard let name = nameTextField.text,
            let address = billingAddressTextView.text,
            let itemCount = shoppingItemController?.addedItems.count else { return }
        
        if name == "" || address == "" { return }
        
        triggerOrderNotification(with: name, address: address, itemCount: itemCount)
        
        view.endEditing(true)
        navigationController?.popViewController(animated: true)
    }
    
    let localNotificationHelper = LocalNotificationHelper()
    var shoppingItemController: ShoppingItemController?
    
    @IBOutlet weak var shoppingCartListLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var billingAddressTextView: UITextView!
    @IBOutlet weak var sendOrderBarButtonItem: UIBarButtonItem!
    
}

extension OrderItemsViewController {
    
    func triggerOrderNotification(with name: String, address: String, itemCount: Int) {
        
        let identifier = "OrderNotification"
        let content = UNMutableNotificationContent()
        content.title = "Order for \(name), your delivery is on the way"
        content.body = itemCount > 1 ? "\(itemCount) items will be delivered to \(address) in 15 minutes!" : "1 item will be delivered to \(address) in 15 minutes!"
        content.badge = 1
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 4, repeats: false)
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error {
                NSLog("Error triggering notification: \(error)")
            }
        }
    }
}

fileprivate func convertToUIApplicationOpenExternalURLOptionsKeyDictionary(_ input: [String: Any]) -> [UIApplication.OpenExternalURLOptionsKey: Any] {
	return Dictionary(uniqueKeysWithValues: input.map { key, value in (UIApplication.OpenExternalURLOptionsKey(rawValue: key), value)})
}
