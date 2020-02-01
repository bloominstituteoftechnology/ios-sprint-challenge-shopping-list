//
//  PlaceOrderViewController.swift
//  Shopping List
//
//  Created by Chris Gonzales on 1/31/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class PlaceOrderViewController: UIViewController {
    
    
    var shoppingList: [ShoppingItem]?
    var shoppingListController: ShoppingListController?
    
    @IBOutlet weak var orderInformationLabel: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var addressTextField: UITextField!
    
    @IBAction func placeOrderButton(_ sender: UIButton) {
        orderAlert()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let shoppingList = shoppingList{
            var orderedItemCount: Int = 0
            for item in shoppingList{
                if item.hasBeenAddedToList{
                    orderedItemCount += 1
                }
            }
            if orderedItemCount > 1{
                orderInformationLabel.text = "You have \(orderedItemCount) items in your shopping cart."
            } else{
                orderInformationLabel.text = "You do not have any items in your shopping list."
            }
        }
        
    }
    
    // MARK - Alert
    
    func orderAlert(){
        
        guard let listCount = shoppingList?.count,
            let address = addressTextField.text else {return}
        let orderAlert = UIAlertController(title: "You're order has been placed", message: "You have \(listCount)) items heading to \(address). You're order should arrive in 15 min.", preferredStyle: .alert)
        
        let acknowledgeAction = UIAlertAction(title: "Return to shopping list.", style: .cancel, handler: nil)
        
        orderAlert.addAction(acknowledgeAction)
        present(orderAlert, animated: true, completion: nil)
    }
    
    
}
