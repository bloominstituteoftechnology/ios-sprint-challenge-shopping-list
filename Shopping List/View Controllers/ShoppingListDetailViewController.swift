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
    var shoppingItem: [ShoppingItem] = [] {
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
    
    
    func showAlert() {
        let alert = UIAlertController(title: "Order Successful!!!", message: "\(userNameTextField.text ?? " ") your order will be delivered to \(userAddressTextField.text ?? " ")in 15 mins", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(okAction)
        present(alert,animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let shoppingItemController = shoppingItemController else { return }
        numberOfItemsLabel.text = "You currently have \(itemsInCart) items(s) in your shopping list"
    }
    
    func onSelectedAddCart(with item: ShoppingItem) {
        
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
