//
//  OrderViewController.swift
//  Shopping List
//
//  Created by Casualty on 8/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController {
    
    @IBOutlet weak var itemTotalLabel: UILabel!
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var addressLabel: UITextField!
    @IBOutlet weak var btnSendOrder: UIButton!
    
    var items: [ShoppingItem]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let items = items else { return }
        
        itemTotalLabel.text = "There are (\(items.count)) items in your cart."
        
    }
    
    @IBAction func sendOrderTapped(_ sender: Any) {
        let alert = UIAlertController(title: "Thank you!", message: "Thanks, \(String(describing: nameLabel.text ?? ""))! Your order will be delivered to \(String(describing: addressLabel.text ?? "")).", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Thanks", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
}
