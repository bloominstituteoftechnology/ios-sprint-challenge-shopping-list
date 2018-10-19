import UIKit
import UserNotifications

class OrderItemsViewController: UIViewController, UNUserNotificationCenterDelegate {
    var shoppingItemController: ShoppingItemController?
//o
    
    //o
    
    //o
    
    //o
    
    //a
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        updateViews()
    }
    
    func updateViews() {
        guard let shoppingItemController = shoppingItemController else {return}
        var shoppingList = Array(shoppingItemController.addeditems)
        
//        if shoppingList.count > 1 {
//            
//        }
    }

}
