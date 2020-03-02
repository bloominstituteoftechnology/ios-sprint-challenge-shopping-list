//
//  ShoppingListViewController.swift
//  Shopping List
//
//  Created by David Williams on 2/23/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListViewController: UIViewController{
    
    var shoppingController: ShoppingController?
    
    @IBOutlet weak var itemsOrderedLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemRed
        nameTextField.backgroundColor = UIColor(white: 1, alpha: 0.75)
        addressTextField.backgroundColor = UIColor(white: 1, alpha: 0.75)
        updateViews()
        // Do any additional setup after loading the view.
    }
   
    func updateViews() {
        
        itemsOrderedLabel.text = "\(numberOfItems) items added"
    }
    
    @IBAction func submitOrderTapped(_ sender: Any) {
        guard let name = nameTextField.text,
            let address = addressTextField.text,
            !name.isEmpty,
            !address.isEmpty else { return }
        
        if numberOfItems == 0 {
            let alert = UIAlertController(title: "You don't have any items to process!", message: "Please order something", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Done", style: .destructive, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
        let alert = UIAlertController(title: "\(name), your Order will arrive in 15 minutes!", message: "To \(address)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Done", style: .destructive, handler: nil))
        self.present(alert, animated: true, completion: nil)
        }
    }
    
}
