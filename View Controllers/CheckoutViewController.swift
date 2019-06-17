//
//  CheckoutViewController.swift
//  Shopping List
//
//  Created by Kat Milton on 6/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CheckoutViewController: UIViewController {
    
    @IBOutlet var numberOfItemsInCart: UILabel!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var addressTextField: UITextField!
    
    var items: [ShoppingItem] = []
    var shoppingItemController: ShoppingItemController?
    
    var itemsInCart: Int {
        return items.count
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        guard let items = shoppingItemController?.itemsInCart else { return }
        numberOfItemsInCart.text = "You have \(items) item(s) in your order."
    }
    
    
    @IBAction func sendOrderPressed(_ sender: UIButton) {
        showAlert()
        nameTextField.text = nil
        addressTextField.text = nil
        
    }
    
    private func presentViewController(alert: UIAlertController, animated flag: Bool, completion: (() -> Void)?) -> Void {
        UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: flag, completion: completion)
    }

    func showAlert() {
        if let name = nameTextField.text {
            if let address = addressTextField.text {
                if name != "" && address != "" {
                    let alert = UIAlertController(title: "Delivery for \(name)", message: "Your order will be delivered to \(address) in 15 minutes.", preferredStyle: .alert)
                    
                                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                                presentViewController(alert: alert, animated: true, completion: nil)
                } else if name == "" || address == "" {
                    let alert = UIAlertController(title: "Missing Information!", message: "Please complete the information in each field.", preferredStyle: .alert)
        
                        alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
                            presentViewController(alert: alert, animated: true, completion: nil)
                }
            }
        }
    
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
