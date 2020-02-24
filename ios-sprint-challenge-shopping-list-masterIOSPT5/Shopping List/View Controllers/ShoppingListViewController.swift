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
        
        
        let alert = UIAlertController(title: "\(name), your Order will arrive in 15 minutes!", message: "To \(address)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Done", style: .destructive, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
