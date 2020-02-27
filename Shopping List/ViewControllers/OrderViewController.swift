
import UIKit

class OrderViewController: UIViewController {
    
    @IBOutlet weak var numberOfItemsLabel: UILabel!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    
    var itemCount: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    @IBAction func sendOrderTapped(_ sender: UIButton) {
        guard let name = userNameTextField.text, let address = addressTextField.text, !name.isEmpty, !address.isEmpty else { return }
        sendAlert(to: name, at: address)
    }
    
    func updateViews() {
        guard let itemCount = itemCount else { return }
        
        numberOfItemsLabel.text = "You currently have \(itemCount) item(s) in your shopping list."
    }
    
    private func sendAlert(to name: String, at address: String) {
        let title = "Delivery for \(name)!"
        let message = "Your items will be delivered to \(address) in 15 minutes."
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        
        let action = UIAlertAction(title: "Ok", style: .default) { alert in self.navigationController?.popToRootViewController(animated: true)}
        alert.addAction(action)
        
        present(alert, animated: true)
    }
}


