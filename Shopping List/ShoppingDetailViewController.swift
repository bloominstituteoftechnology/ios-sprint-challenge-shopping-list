//
//  ShoppingDetailViewController.swift
//  Shopping List
//
//  Created by Bradley Diroff on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingDetailViewController: UIViewController {

    
    @IBOutlet var howManyLabel: UILabel!
    @IBOutlet var nameLabel: UITextField!
    @IBOutlet var addressLabel: UITextField!
    
    var shopList: [ShoppingItem]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    
    @IBAction func sendOrderTapped(_ sender: UIButton) {
        guard let name = nameLabel.text, let address = addressLabel.text else {return}
        
        alertHandling(name: name, address: address)
    }
    
    func alertHandling(name: String, address: String) {
        if name == "" || address == "" {
            let alert = UIAlertController(title: "Fill in the fields!", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "My bad", style: .default, handler: nil))
            
            self.present(alert, animated: true)
        } else {
            let alert = UIAlertController(title: "\(name), your order is coming!", message: "Delivery will be arriving at \(address).", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Alright", style: .default, handler: nil))
            
            self.present(alert, animated: true)
        }
    }
    
    func updateViews() {
        guard let shopList = shopList else {return}
        howManyLabel?.text = "You have \(shopList.count) item(s) in your cart"
    }

}
