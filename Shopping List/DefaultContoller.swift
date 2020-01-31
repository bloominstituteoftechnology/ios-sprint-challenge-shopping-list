//
//  DefaultContoller.swift
//  Shopping List
//
//  Created by Chris Gonzales on 1/31/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation


class shoppingListDefaults{
    
    let addedToListPreferenceKey: String = "addedToListPreferenceKey"
    
    func setDefaultPreferences(){
        UserDefaults.standard.set(<#T##value: Bool##Bool#>, forKey: addedToListPreferenceKey)
    }
    
    
    init() {
        guard addedToListPreferenceKey == nil else { return }
            setDefaultPreference()
        
    }
    
    
    
    
}
