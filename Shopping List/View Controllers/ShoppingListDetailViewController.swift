//
//  ShoppingListDetailViewController.swift
//  Shopping List
//
//  Created by David Wright on 12/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListDetailViewController: UIViewController {

    // MARK: Properties

    var shoppingCart: [ShoppingItem]?
    
    var numItemsInCart: Int? {
        return shoppingCart?.count
    }
    
    // MARK: IBOutlets

    @IBOutlet weak var cartSummaryLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    // MARK: IBOutlets

    @IBAction func sendOrderButtonTapped(_ sender: UIButton) {
        guard let numItemsInCart = numItemsInCart,
            numItemsInCart > 0,
            let name = nameTextField.text,
            let address = addressTextField.text else { return }
        showAlert(name: name, address: address)
    }
    
    // MARK: Methods

    private func showAlert(name: String, address: String) {
        let alert = UIAlertController(title: "Delivery for \(name)!", message: "Your shopping items will be delivered to \(address) in 15 minutes!", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let numItemsInCart = numItemsInCart else { return }
        cartSummaryLabel.text = "You currently have \(numItemsInCart) item(s) in your shopping list."
    }

}
