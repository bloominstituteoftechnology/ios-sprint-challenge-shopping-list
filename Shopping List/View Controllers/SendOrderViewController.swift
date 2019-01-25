//
//  SendOrderViewController.swift
//  Shopping List
//
//  Created by Stuart on 1/25/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class SendOrderViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let count = shoppingItemController?.shoppingItems.count else { return }
        label.text = "You have \(count) items in your Shopping List"
    }
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var addressField: UITextField!
    
    @IBAction func send(_ sender: UIButton) {
        
    }
    
    var shoppingItemController: ShoppingItemController?
}
