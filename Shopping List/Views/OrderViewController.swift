//
//  OrderViewController.swift
//  Shopping List
//
//  Created by conner on 2/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var nameTF: UITextField!
       
    @IBOutlet weak var addressTF: UITextField!
    
    @IBAction func sendOrderTapped(_ sender: UIButton) {
        // Ensure fields are filled in
        guard let name = nameTF.text, let address = addressTF.text else { return }
        if nameTF.text == "" || addressTF.text == "" { return }
        
        // Alert
        let alert = UIAlertController(title: "Delivery for \(name)!", message: "Your items will be delivered to \(address) in 15 minutes!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true)
        navigationController?.popViewController(animated: true)
    }

    var shoppingListController = ShoppingListController()
    var shoppingItem: ShoppingItem?{
        didSet{
            updateViews()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    func updateViews(){
        if shoppingListController.added.count == 1 {
            label.text = "You currently have 1 item in your shopping list"
        } else {
            label.text = "You currently have \(shoppingListController.added.count) items in your shopping list"
        }
    }
}
