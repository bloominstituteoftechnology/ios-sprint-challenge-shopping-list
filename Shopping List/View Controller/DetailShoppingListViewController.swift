//
//  DetailShoppingListViewController.swift
//  Shopping List
//
//  Created by Iyin Raphael on 8/10/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class DetailShoppingListViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateView()
        
    }
    
    func updateView(){
        guard let shoppingItemController = shoppingItemController else {return}
        let numberOfItem = shoppingItemController.addedItem.count
        messageLabel.text = "You currently have \(numberOfItem) item(s) in your shopping list"
    }

    @IBAction func sendOrder(_ sender: Any) {
        guard let name = nameTextField.text,
            let address = addressLabel.text else {return}
        
        let numberOfItems = shoppingItemController?.addedItem.count
        if numberOfItems == 0 || name.isEmpty || address.isEmpty {return}
        
        notificationHelper.requestAuthorization { (authorizationStatus) in
            if authorizationStatus == true{
                self.notificationHelper.setNotification()
            } else {
                return
            }
        }
        
        nameTextField.text = ""
        addressLabel.text = ""
        shoppingItemController?.clearCart()
        shoppingItemController?.saveToPersistence()
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var addressLabel: UITextField!
    
    

   var shoppingItemController: ShoppingItemController?
    let notificationHelper = LocalNotificationHelper()
}
