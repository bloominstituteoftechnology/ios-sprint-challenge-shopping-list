//
//  ShoppingListDetailViewController.swift
//  Shopping List
//
//  Created by Joshua Sharp on 8/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListDetailViewController: UIViewController {

    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextView: UITextView!
    
    var shoppingListController: ShoppingListController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let count = shoppingListController?.shoppingList.filter({$0.selected == true}).count
        if let count = count {
                topLabel.text = "You currently have \(count) items in your shopping list."
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func shipTapped(_ sender: Any) {
        let count = shoppingListController?.shoppingList.filter({$0.selected == true}).count
        if let count = count {
            if count > 0 {
                let alert = UIAlertController(title: "Delivery", message: "Your order will be delivered in 15 minutes to: \n\(String(nameTextField.text ?? "") + " @\n" + String(addressTextView.text ?? ""))", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                present(alert, animated: true)
            } else {
                let alert = UIAlertController(title: "Delivery", message: "You need to select some items, please.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                present(alert, animated: true)
            }
        }
        navigationController?.popViewController(animated: true)
    }
}
