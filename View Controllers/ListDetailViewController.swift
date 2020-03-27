//
//  ListDetailViewController.swift
//  Shopping List
//
//  Created by Patrick Millet on 11/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ListDetailViewController: UIViewController {
    
    var shoppingItemController: ShoppingItemController?

    @IBOutlet weak var customerName: UITextField!
    @IBOutlet weak var customerAddress: UITextField!
    @IBOutlet weak var labelTextOutlet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelTextOutlet.text = "You currently have \(shoppingItemController!.shoppingList.filter({$0.isAdded}).count) Item(s) in your shopping list."

        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitOrderTapped(_ sender: Any) {
        guard let name = customerName.text,
                let address = customerAddress.text else { return }

            let alert = UIAlertController(title: "Delivery for \(name)", message: "Your order will be sent to \(address) in 15 mins!", preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
