//
//  SubmitOrderViewController.swift
//  Shopping List
//
//  Created by Osha Washington on 12/13/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class SubmitOrderViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var itemsLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    var shoppingItemController: ShoppingItemController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    
    func updateViews() {
               guard let shoppingItemController = shoppingItemController else { return }
                nameTextField.becomeFirstResponder()
                let shoppingItemCount = shoppingItemController.addedItems.count
                itemsLabel.text = "You have \(shoppingItemCount) item(s) in your shopping list."
           }
    
    //MARK: - IBActions
    @IBAction func orderSent(_ sender: Any) {
        guard let name = nameTextField.text,
              let address = addressTextField.text,
            !name.isEmpty,
            !address.isEmpty else { return }
        
        showOrderAlert()
    }
        
        private func showOrderAlert() {
            let alert = UIAlertController(title: "Order Submitted!", message: "\(nameTextField.text!) your order will be delivered in 15 minutes to \(addressTextField.text!).", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)

        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
         present(alert, animated: true)
        }
    


}
