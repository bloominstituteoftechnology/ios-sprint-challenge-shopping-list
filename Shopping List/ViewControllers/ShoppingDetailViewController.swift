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
        
    }
    
    //MARK: - Helper Functions:
    func updateViews(){
        guard let shoppingItemController = shoppingItemController else {return}
        let itemsInCart = shoppingItemController.shoppingItems.filter{$0.hasBeenAdded == true}
        itemsInCartLabel.text = "You have added \(itemsInCart.count) to your cart."
    }
    
    func showAlert(){
        let alert = UIAlertController(title: "BadaBing BadaBoom", message: "Gracias friend. Your groceries will be delivered to you address in 15 minutes.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)

    }
}
