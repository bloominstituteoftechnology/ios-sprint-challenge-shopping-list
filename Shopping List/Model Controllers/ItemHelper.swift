//
//  ItemHelper.swift
//  Shopping List
//
//  Created by Cody Morley on 3/31/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation


class ItemHelper {
    
    let shoppingItemController = ShoppingItemController()
    var itemPreferenceKey: String = "Key"
    var itemPreferences: [ShoppingItem]?
    
    func saveView() {
        let itemPreferences = shoppingItemController.shoppingItems
        UserDefaults.standard.set(itemPreferences, forKey: itemPreferenceKey)
    }
    
    func loadView() {
        let itemPreferences = UserDefaults.standard.array(forKey: itemPreferenceKey)
    }
}
