import UIKit

class CheckoutViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var checkoutTitle: UILabel!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var addressTectField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBActions
    @IBAction func sendOrderButtonTapped(_ sender: UIButton) {
    }
    
}
