import UIKit

class CheckoutViewController: UIViewController {
    
    let shoppingListController = ShoppingListController()
    
    // MARK: - IBOutlets
    @IBOutlet var checkoutTitle: UILabel!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var addressTectField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTitle()
    }
    
    func updateTitle() {
        let filteredArray = shoppingListController.shoppingItems.filter { $0.hasBeenAdded == true }
        let countTitle = filteredArray.count
        checkoutTitle.text = "You have \(String(countTitle)) item(s) in your shopping list."
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
