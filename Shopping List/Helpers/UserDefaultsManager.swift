//
//  UserDefaultsManager.swift
//  Shopping List
//
//  Created by Jonathan T. Miles on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

class UserDefaultsManager {
    
    let shoppingListInitKey: String = "ShoppingListInitKey"
    
    func initShoppingList() {
        UserDefaults.standard.set(true, forKey: shoppingListInitKey)
    }
    
    var hasShoppingListBeenInitialized: Bool {
        let shoppingInit = UserDefaults.standard.bool(forKey: shoppingListInitKey)
        return shoppingInit
    }
}
