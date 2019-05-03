//
//  ShoppingItemDetailViewController.swift
//  Shopping List
//
//  Created by morse on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemDetailViewController: UIViewController {
    @IBOutlet var listCountLabel: UILabel!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var addressTextField: UITextField!
    
    var shoppingItemController: ShoppingItemController?
    var itemCount: Int {
        guard let items = shoppingItemController?.shoppingItems else { return 0 }
        var count = 0
        for i in 0..<items.count {
            if items[i].hasBeenAdded == true {
                count += 1
            }
        }
        return count
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if itemCount == 1 {
            listCountLabel.text = "You currently have 1 item in your\nshopping list"
        } else {
            listCountLabel.text = "You currently have \(itemCount) items in your\nshopping list"
        }
    }
    
    @IBAction func sendOrderButtonTapped(_ sender: Any) {
        guard let name = nameTextField.text, let address = addressTextField.text else { return }
        let alert = UIAlertController(title: "Delivery for \(name)!", message: "Your shopping items will be delivered to \(address) in 15 minutes!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true)
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
