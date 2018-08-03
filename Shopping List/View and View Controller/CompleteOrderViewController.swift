//
//  CompleteOrderViewController.swift
//  Shopping List
//
//  Created by Andrew Liao on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class CompleteOrderViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateView()
        
        
        
    }
    
    func updateView(){
        guard let shoppingItemController = shoppingItemController else {return}
        let numberOfItems = shoppingItemController.shoppingCart.count
        
        messageLabel.text = "You currently have \(numberOfItems) item(s) in your shopping list"
    }
    
    
    
    //MARK: - Properties
    var shoppingItemController: ShoppingItemController?
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var addressLabel: UITextField!
}
