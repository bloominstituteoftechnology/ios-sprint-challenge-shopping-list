//
//  OrderDetailViewController.swift
//  Shopping List
//
//  Created by Cora Jacobson on 6/13/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class OrderDetailViewController: UIViewController {
    
    @IBOutlet weak var orderSummaryLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    var shoppingItemController: ShoppingItemController?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func placeOrderButton(_ sender: UIButton) {
        let addedItems = shoppingItemController?.shoppingItems.filter { $0.addedToList == true }
        let alert = UIAlertController(title: "Thank you, \(nameTextField.text ?? "User")", message: "Your order contains \(addedItems?.count ?? 0) items. Your order will be delivered in 15 minutes.", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
    }
    
}
