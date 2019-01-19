//
//  ListHelper.swift
//  Shopping List
//
//  Created by Jocelyn Stuart on 1/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ListHelper {
    let listKey: String = "listKey"
    
    init() {
        
        if themePreference == nil {
            let userDefaults = UserDefaults.standard
            userDefaults.set("None Added", forKey: listKey)
        }
    }
    
    func setThemePreferenceToInitial() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("None Added", forKey: listKey)
    }
    
    func setThemePreferenceToAddedList() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Added List", forKey: listKey)
    }
    
    var themePreference: String? {
        let shouldShowAdded = UserDefaults.standard.string(forKey: listKey)
        return shouldShowAdded
        
    }
    
    
    
    
    
    
}
