//
//  SendOrderViewController.swift
//  Shopping List
//
//  Created by Lambda_School_Loaner_204 on 10/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class SendOrderViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    var shoppingListController: ShoppingListController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateViews()
    }
    

    // MARK: - Class Functions
    func updateViews() {
        guard let shoppingListController = shoppingListController else { return }
        
        nameTextField.becomeFirstResponder()
        let shoppingListCount = shoppingListController.addedItems.count
        
        titleLabel.text = "You currently have \(shoppingListCount) item(s) in your shopping list."
    }
    
    private func showOrderAlert() {
        let alert = UIAlertController(title: "Order Submitted!", message: "\(nameTextField.text!) your order will be delivered in 15 minutes to \(addressTextField.text!).", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    // MARK: - IBActions
    
    @IBAction func sendOrderTapped(_ sender: UIButton) {
        guard let nameText = nameTextField.text,
            let addressText = addressTextField.text,
            !nameText.isEmpty,
            !addressText.isEmpty else { return }
        
        showOrderAlert()
    }

}
