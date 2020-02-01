//
//  DefaultContoller.swift
//  Shopping List
//
//  Created by Chris Gonzales on 1/31/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation


class ShoppingListDefaults{
    
//    var itemIsOrdered: Bool {
//        UserDefaults.standard.register(defaults: ["IsOrdered": false])
//        return UserDefaults.standard.bool(forKey: "isOrdered")
//    }
//


    
    
    
    let defaults = UserDefaults.standard

    func setDefaultPreferences(){
        defaults.set(false, forKey: "addedToList")
    }
    
//    defaults.set(false, forKey: "addedItem")
//
//
//
//    let addedToListPreferenceKey: String = "addedToListPreferenceKey"
//
//    func setDefaultPreferences(){
//        UserDefaults.standard.set(
//
//            , forKey: addedToListPreferenceKey)
//    }
//
//    var addedToListPreferences: String?{
//        return
//            UserDefaults.standard.string(forKey: addedToListPreferenceKey)
//    }
//
//    init() {
//        guard addedToListPreferences == nil else { return }
//            setDefaultPreferences()
//
//    }
//
    
    
    
}
