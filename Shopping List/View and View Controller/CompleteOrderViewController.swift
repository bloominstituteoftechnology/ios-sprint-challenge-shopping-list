//
//  CompleteOrderViewController.swift
//  Shopping List
//
//  Created by Andrew Liao on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class CompleteOrderViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateView()
        
    }
    
    func updateView(){
        guard let shoppingItemController = shoppingItemController else {return}
        let numberOfItems = shoppingItemController.shoppingCart.count
        
        messageLabel.text = "You currently have \(numberOfItems) item(s) in your shopping list"
    }
    
    
    
    @IBAction func sendOrder(_ sender: Any) {
       //checks to make sure label has text else do nothing
        guard let name = nameLabel.text,
            let address = addressLabel.text else {return}
        
        //checks to see if the shopping cart is empty or the text is empty.
        let numberOfItems = shoppingItemController?.shoppingCart.count
        if numberOfItems == 0 || name.isEmpty || address.isEmpty {return}
        
        //request Authorization for notification
        notificationHelper.requestAuthorization { (authorizationStatus) in
            if authorizationStatus == true{
                self.notificationHelper.setNotification()
            } else {
                return
            }
        }
        
        //Once authorized, clear everything, save to persistent store and pop back to previous VC
        nameLabel.text = ""
        addressLabel.text = ""
        shoppingItemController?.clearCart()
        shoppingItemController?.saveToPersistenceStore()
        navigationController?.popViewController(animated: true)
    }

    
    
    
    
    //MARK: - Properties
    var shoppingItemController: ShoppingItemController?
    let notificationHelper = LocalNotificationHelper()
    
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var addressLabel: UITextField!
}
