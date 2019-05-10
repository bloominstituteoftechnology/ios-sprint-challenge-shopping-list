//
//  ShoppingListDetailViewController.swift
//  Shopping List
//
//  Created by Steven Leyva on 5/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        

        
    }
  
    @IBAction func sendOrder(_ sender: Any) {
        
    }
    
    var shoppingListController: ShoppingListController?
    var shoppingList: ShoppingList?
    
    @IBOutlet var nameText: UIView!
    @IBOutlet var addressText: UIView!
    @IBOutlet weak var ordersLabel: UILabel!
    

}
