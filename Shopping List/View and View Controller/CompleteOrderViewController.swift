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
        
        notificationHelper.requestAuthorization { (authorizationStatus) in
            if authorizationStatus == true{
                self.notificationHelper.setNotification()
            }
        }
    }

    
    
    
    
    //MARK: - Properties
    var shoppingItemController: ShoppingItemController?
    let notificationHelper = LocalNotificationHelper()
    
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var addressLabel: UITextField!
}
