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
    
    @IBAction func sendOrderTapped(_ sender: UIButton) {
        guard let addedItems = addedItems else { return }
        print(addedItems)
    }
    
    var addedItems: [ShoppingItem]?
    
}
