import UIKit

class ShoppingListDetailViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let amount = shoppingItemController?.totalInCart() else { return }
        currentItemsLabel?.text = "You currently have \(amount) item(s) in your shopping list"
    }
    
    @IBAction func sendOrder(_ sender: Any) {
        guard let name = nameTextField.text,
            let address = addressTextField.text
            else { return }
        
        localNotificationHelper?.getAuthorizationStatus { (status) in
            switch status {
            case .authorized:
                self.localNotificationHelper?.sendOrderNotification(name: name, address: address)
            case.notDetermined:
                self.localNotificationHelper?.requestAuthorization(completion: { (granted) in
                    if (granted) {
                        self.localNotificationHelper?.sendOrderNotification(name: name, address: address)
                    }
                })
            default:
                return
            }
        }
    }
    
    
    @IBOutlet weak var currentItemsLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    var shoppingItemController: ShoppingItemController?
    var localNotificationHelper: LocalNotificationHelper?
    
    
    
    
}
