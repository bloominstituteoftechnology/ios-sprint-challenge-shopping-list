//
//  ShoppingListDetailViewController.swift
//  Shopping List
//
//  Created by Richard Gibbs on 5/25/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit


class ShoppingListDetailViewController: UIViewController {
    
    var shoppingItemController: ShoppingItemController?
    var itemsInCart = 0 {
        didSet {
            numberOfItemsLabel.text = "You currently have \(itemsInCart) item(s) in your shopping list"
        }
    }
    
    
    @IBOutlet weak var numberOfItemsLabel: UILabel!
    @IBOutlet weak var userAddressTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var submitOrderButton: UIButton!
    
    @IBAction func tappedSubmitOrder(_ sender: Any) {
        showAlert()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Order Successful!!!", message: "\(userNameTextField.text ?? " ") your order will be delivered to \(userAddressTextField.text ?? " ")in 15 mins", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(okAction)
        present(alert,animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //    guard let shoppingItemController = shoppingItemController else { return }
        //    itemsInCart = shoppingItemController.shoppingItems.count
        //    numberOfItemsLabel.text = "You currently have \(itemsInCart) items(s) in your shopping list"
    }
    func updateViews() {
        if let shoppingController = shoppingItemController {
            let cartItems = shoppingController.shoppingItems
            for items in cartItems {
                if items.added == true{
                    itemsInCart += 1
                }
                numberOfItemsLabel.text = "You currently have \(itemsInCart) item(s) in your shopping list"
                print(cartItems)
                print(itemsInCart)
            }
        }
    }
}
