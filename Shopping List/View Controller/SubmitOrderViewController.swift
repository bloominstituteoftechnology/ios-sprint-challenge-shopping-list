//
//  SubmitOrderViewController.swift
//  Shopping List
//
//  Created by Hayden Hastings on 5/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class SubmitOrderViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        message()
    }
    
    func message() {
        if let numberOfItems = shoppingItemController?.selectedItems.count {
            messagelabel.text = "You currently have \(numberOfItems) item's in your shopping list."
        }
    }
    
    func submitButton() {
        let alert = UIAlertController(title: "Submited", message: "Thanks \(nameTextField.text!)! The items you have added will be delived to your address at \(addressTextField.text!) in 15 Minutes", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {_ in let alert = UIAlertController(title: "Thank You", message: "You have successfully submitted your order.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: {_ in self.navigationController?.popViewController(animated: true)}))
            self.present(alert, animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        submitButton()
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var messagelabel: UILabel!
    
    var shoppingItemController: ShoppingItemController?
}
