//
//  ShoppingDetailViewController.swift
//  Shopping List
//
//  Created by Clayton Watkins on 5/1/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingDetailViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var itemsInCartLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    //MARK: - Properties
    var shoppingItemController: ShoppingControler?
    var shoppingItem: ShoppingItem?
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    //MARK: - IBActions
    @IBAction func sendOrderTapped(_ sender: Any) {
        showAlert()
    }
    
    //MARK: - Helper Functions:
    func updateViews(){
        guard let shoppingItemController = shoppingItemController else {return}
        let itemsInCart = shoppingItemController.shoppingItems.filter{$0.hasBeenAdded == true}
        itemsInCartLabel.text = "You have added \(itemsInCart.count) to your cart."
    }
    
    func showAlert(){
        guard let name = nameTextField.text, !name.isEmpty,
        let address = addressTextField.text, !address.isEmpty else {return}
        let alert = UIAlertController(title: "Gracias \(name)", message: "Your groceries will be delivered to you at \(address) in 15 minutes.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "BadaBing BadaBoom", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
}
