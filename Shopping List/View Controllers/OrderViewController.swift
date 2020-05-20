//
//  OrderViewController.swift
//  Shopping List
//
//  Created by Niranjan Kumar on 10/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    var shoppingItem: [ShoppingItem] = []
    
    var shoppingListController: ShoppingListController?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addOrder (_ sender: Any) {
        showAlert()
         
    }
    
    
    func updateViews() {
    
//                let addedItems = shoppingItem.filter {$0.hasBeenAdded}
//
//                if addedItems.isEmpty {
//                    descriptionLabel.text = "There is nothing in your shopping cart!"
//                } else {
//                    descriptionLabel.text = "You have \(addedItems.count) item(s) in your shopping cart."
//                }
//
        descriptionLabel.text = "You have a few items in your cart!"
    }
    

    func showAlert() {
        guard let name = nameTextField.text, !name.isEmpty,
            let address = addressTextField.text, !address.isEmpty else { return }
    
        let alert = UIAlertController(title: "Hey \(name)!", message: "Your items will be delivered to \(address) pretty soon!", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cool!", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
}
