import UIKit

class OrderShoppingListItemsViewController: UIViewController {
    
    let localNotificationHelper = LocalNotificationHelper()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var itemCountLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    @IBAction func orderButton(_ sender: Any) {
        
        //authorizer permision for notifications
        // send text in name text field and address field to notification title and body
        
    }
    
    
    

 

}
