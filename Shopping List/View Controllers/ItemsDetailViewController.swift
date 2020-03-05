//
//  ItemsDetailViewController.swift
//  Shopping List
//
//  Created by Harmony Radley on 3/5/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ItemsDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    @IBAction func sendOrder(_ sender: Any) {
        alert()
        }
        
     
    
    func alert() {
        if let name = nameLabel.text,
            let address = addressLabel.text {
            let alert = UIAlertController(title: "Hello \(name)!", message: "Your items will be delivered in 15 mintues to \(address).", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true)
        }
    }
    
    func updateViews() {
        if let shoppingController = shoppingContoller {
            let items = shoppingController.shoppingItems.filter( {$0.hasBeenAdded == true })
        }
    }
    
    
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var addressLabel: UITextField!
   
    var item: ShoppingItem?
    var shoppingContoller: ShoppingListController?
}
