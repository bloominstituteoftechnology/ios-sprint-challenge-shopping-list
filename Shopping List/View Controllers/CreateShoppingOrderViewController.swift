//
//  CreateShoppingOrderViewController.swift
//  Shopping List
//
//  Created by Conner on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class CreateShoppingOrderViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let itemCount = shoppingController?.inShoppingList.count else { return }
        itemsInShoppingListLabel?.text = "You currently have \(itemCount) items(s) in your shopping list."
    }
    
    
    @IBOutlet var itemsInShoppingListLabel: UILabel!
    var shoppingController: ShoppingController?
}
