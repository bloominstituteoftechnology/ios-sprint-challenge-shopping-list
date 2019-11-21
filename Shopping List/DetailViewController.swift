//
//  DetailViewController.swift
//  Shopping List
//
//  Created by Zack Larsen on 11/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var ItemsInShoppingList: UILabel!
    @IBOutlet weak var NameLabel: UITextField!
    @IBOutlet weak var AddressLabel: UITextField!
    
    var shoppingListController: ShoppingListController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    
    @IBAction func SendOrderButton(_ sender: Any) {
        guard let name = NameLabel.text,
            let address = AddressLabel.text
            else { return }
          let itemsCount = shoppingListController?.newShoppingItem.count
        
        let alert = UIAlertController(title: "Submit Order for: \(name) of \(itemsCount) items", message: "Deliver to: \(address)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)

    }
    
    func updateViews() {
        guard let items = shoppingListController?.newShoppingItem.count else { return }
        ItemsInShoppingList.text = "You have \(items) items in your cart"
    }
    
}
