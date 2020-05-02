//
//  OrderScreenViewController.swift
//  Shopping List
//
//  Created by Bronson Mullens on 5/1/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class OrderScreenViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var addressLabel: UITextField!
    @IBOutlet weak var cartLabel: UILabel!
    
    
    // MARK: - IBActions
    @IBAction func sendOrderTapped(_ sender: Any) {
        alert()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    func updateViews() {
        guard let itemsInCart = shoppingController?.shoppingItems.filter( { return $0.hasBeenAdded } ) else { return }
        cartLabel.text = "You currently have \(itemsInCart.count) item(s) in your shopping list"
    }
    
    func alert() {
        guard let name = nameLabel.text,
            let address = addressLabel.text,
            !address.isEmpty,
            !name.isEmpty else { return }
        
        let alert = UIAlertController(title: "\(name)'s Order", message: "Your order will be delivered to \(address). Delivery estimate is 15 minutes.", preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: "Confirm", style: .default, handler: nil)
        alert.addAction(confirmAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    var shoppingController: ShoppingController?

}
