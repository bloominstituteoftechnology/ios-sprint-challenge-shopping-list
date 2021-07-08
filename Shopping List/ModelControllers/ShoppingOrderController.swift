//
//  ShoppingOrderController.swift
//  Shopping List
//
//  Created by Carolyn Lea on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import UserNotifications

class ShoppingOrderController
{
    var shoppingOrder: ShoppingOrder?
    
    func createOrder(name: String, address: String)
    {
        let order = ShoppingOrder(name: name, address: address)
        print(order)
    }

}
