//
//  ShoppingListDetailViewController.swift
//  Shopping List
//
//  Created by macbook on 9/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListDetailViewController: UIViewController {
    
    var numberOfAddedItems: Int?
    
    // MARK : - IBOutlets
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    
    
    
    // VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = "You currently have \(numberOfAddedItems) Item(s) in your shopping list."

      
    }
    
    
    // MARK: - IBAction Submit Button
    @IBAction func submitOrderButton(_ sender: UIButton) {
        let alert = UIAlertController(title: "Delivery for\(nameTextField.text)", message: "Your order will be sent to \(addressTextField.text) in 15 mins!", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    

}
