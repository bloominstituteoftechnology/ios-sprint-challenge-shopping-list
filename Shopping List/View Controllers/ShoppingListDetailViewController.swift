//
//  ShoppingListDetailViewController.swift
//  Shopping List
//
//  Created by Michael on 12/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListDetailViewController: UIViewController {

    
    var shoppingList: ShoppingList?
    
    @IBOutlet weak var itemsInListLabel: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var addressTextField: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    
    @IBAction func sendOrderTapped(_ sender: Any) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    func updateViews() {
        var itemCount: [ShoppingList] = []
        if let copyList = shoppingList {
            if copyList.itemAdded {
                itemCount.append(copyList)
            }
        }
        itemsInListLabel.text = "You currently have \(itemCount.count) item(s) in your shopping list."
    }
}
    

