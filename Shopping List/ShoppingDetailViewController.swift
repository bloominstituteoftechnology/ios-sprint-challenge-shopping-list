//
//  ShoppingDetailViewController.swift
//  Shopping List
//
//  Created by Mitchell Budge on 5/5/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingDetailViewController: UIViewController {

    var shoppingMgr: ShoppingManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ShoppingAlert().shoppingDVC = self
        displayInfo()
    }
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBAction func submitOrderButtonPressed(_ sender: Any) {
        submitButton.titleLabel?.text = "Submitted!"
        navigationController?.popViewController(animated: true)
    }
    
    func displayInfo() {
        if let numberOfItems = shoppingMgr?.selectedItems.count {
            messageLabel.text = "You currently have \(numberOfItems) item(s) in your shopping list."
        }
    }

    //Pop back to CollectionVC
    
}
