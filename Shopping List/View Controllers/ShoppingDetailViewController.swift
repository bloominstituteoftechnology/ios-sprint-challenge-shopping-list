//
//  ShoppingDetailViewController.swift
//  Shopping List
//
//  Created by Paul Yi on 1/25/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingDetailViewController: UIViewController {
    var shoppingItemController: ShoppingItemController? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    @IBAction func sendOrder(_ sender: Any) {
        guard let name = nameTextField.text,
            let address = addressTextField.text else { return }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    
    func updateViews() {
        guard let shoppingItems = shoppingItemController?.shoppingItems else { return }
        
        var numberOfItems = 0
        for item in shoppingItems {
            if item.isAdded {
                numberOfItems += 1
            }
        }
        
        textLabel?.text = "You currently have \(numberOfItems) items(s) in your shopping cart."
    }

}
