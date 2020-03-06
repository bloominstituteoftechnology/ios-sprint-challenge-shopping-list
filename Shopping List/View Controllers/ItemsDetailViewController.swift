//
//  ItemsDetailViewController.swift
//  Shopping List
//
//  Created by Harmony Radley on 3/5/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ItemsDetailViewController: UIViewController {

    var item: ShoppingItem?{
        didSet{
            updateViews()
        }
    }
    var shoppingContoller: ShoppingListController?
        // guard let 
    func updateViews() {
        orderAmount.text = "You currently have \(shoppingContoller?.itemNames.count) item(s) in your list."
            }
        
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
            navigationController?.popViewController(animated: true)
        }
    }
    
    
    
    @IBOutlet weak var orderAmount: UILabel!
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var addressLabel: UITextField!
   

}
