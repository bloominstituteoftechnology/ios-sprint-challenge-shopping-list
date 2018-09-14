//
//  CartViewController.swift
//  Shopping List
//
//  Created by Rick Wolter on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit
 import UserNotifications

class CartViewController: UIViewController,UNUserNotificationCenterDelegate {

     var shoppingItemController: ShoppingItemController?
    
    @IBOutlet weak var itemsInCartLabel: UILabel!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var userAddressTextField: UITextField!
    
    @IBAction func sendOrderButton(_ sender: Any) {
    }
    

}
