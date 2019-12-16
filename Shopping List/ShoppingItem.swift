//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Gerardo Hernandez on 12/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct ShoppingItem {
    var name = "Apple"
    var hasBeenAdded: Bool = false
    
   
    let itemPerference = "Apple"
    
    func savePreference() {
        UserDefaults.standard.set(itemPerference, forKey: itemPreferenceKey)
    }
    
    func loadPerference() {
        let itemPerference = UserDefaults.standard.string(forKey: itemPreferenceKey)
    }
    
    let itemPreferenceKey = "itemPreference"
       
    
}


 
