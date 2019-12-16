import UIKit

class CheckoutViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var checkoutTitle: UILabel!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var addressTectField: UITextField!
    
    
    // MARK: - Properties
    var shoppingListController = ShoppingListController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTitle()
    }
    
    // MARK: - Functions
    // Update Checkout Title
    func updateTitle() {
        let cartCountArray = shoppingListController.shoppingItems.filter { $0.hasBeenAdded }
        let cartCount = String(cartCountArray.count)
        checkoutTitle.text = "You currently have \(cartCount) item(s) in your shopping list!"
    }
    
    // Alert
    private func showAlert() {
        let usersName = nameTextField.text
        let usersAddress = addressTectField.text
        let alert = UIAlertController(title: "Hey \(usersName ?? "You")",
                                    message: """
                                            We're sending stuff over to this address in 15 minutes.
                                            Address: \(usersAddress ?? "No Address on File")
                                            """, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    // MARK: - IBActions
    @IBAction func sendOrderButtonTapped(_ sender: UIButton) {
        showAlert()
    }
    
}
