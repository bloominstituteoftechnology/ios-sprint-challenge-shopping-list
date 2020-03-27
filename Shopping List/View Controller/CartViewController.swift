//
//  CartViewController.swift
//  Shopping List
//
//  Created by Cameron Collins on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {

    @IBOutlet weak var labelItemCounter: UILabel!
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldAddress: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    //Variables
    var delegate: ShoppingItemsCollectionViewController?
    var shoppingController: ShoppingCartController?

    @IBAction func buttonSendOrder(_ sender: UIButton) {
        let alert = UIAlertController(title: "(\(textFieldName.text ?? "No Name")'s) Order will Be delivered in 15 minutes!", message: "Order will be delivered to \(textFieldAddress.text ?? "No Address")", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(alertAction)
        present(alert, animated: true)
        
        //Reset Items to not added since you have ordered food
        if let items = shoppingController?.shoppingItems {
            for i in 0...items.count - 1 {
                shoppingController?.shoppingItems[i].hasBeenAdded = false
            }
            
            if let myDelegate = delegate {
                myDelegate.collectionView?.reloadData()
            }
        }
        
    }
    
    //Functions
    func updateViews() {
        var inShoppingCart = 0
        if let myItems = shoppingController?.shoppingItems {
            for i in myItems {
                if i.hasBeenAdded == true {
                    inShoppingCart += 1
                }
            }
        }
        labelItemCounter.text = "You currently have \(inShoppingCart) items in your shopping list!"
    }

}
