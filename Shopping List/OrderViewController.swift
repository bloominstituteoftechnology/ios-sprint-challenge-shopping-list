//
//  OrderViewController.swift
//  Shopping List
//
//  Created by Nathanael Youngren on 1/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let addedItems = addedItems else { return }
        
        if addedItems.count != 0 {
            orderLabel.text = "You currently have \(addedItems.count) in your cart."
        } else {
            orderLabel.text = "You haven't added any items to your order."
        }
    }
  
    @IBOutlet weak var orderLabel: UILabel!
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var addressLabel: UITextField!
    
    
    @IBAction func sendOrderTapped(_ sender: UIButton) {
        guard let addedItems = addedItems else { return }
        guard let name = nameLabel.text else { return }
        guard let address = addressLabel.text else { return }
        
        
        var orderMessage = "\(name)'s order:\n"
        
        for item in addedItems {
            orderMessage.append("\(item.name)\n")
        }
        
        orderMessage.append("Deliver to: \(address)")
        
        print(orderMessage)
    }
    
    var addedItems: [ShoppingItem]?
    
}
