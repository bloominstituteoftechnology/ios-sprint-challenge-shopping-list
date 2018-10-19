import UIKit
import UserNotifications

class OrderItemsViewController: UIViewController, UNUserNotificationCenterDelegate {
    var shoppingItemController: ShoppingItemController?
    @IBOutlet weak var shoppingCartListLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressView: UITextView!
    @IBOutlet weak var sendOrderButton: UIBarButtonItem!
    
    @IBAction func sendOrder(_ sender: Any) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        updateViews()
    }
    
    func updateViews() {
        guard let shoppingItemController = shoppingItemController else {return}
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
            title = "Ordering 0 itemes"
        }
    }

}
