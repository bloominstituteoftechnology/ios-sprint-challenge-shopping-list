//
//  AddItemHelper.swift
//  Shopping List
//
//  Created by Harmony Radley on 3/5/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit


class addPreference {

    private let addItemPreferenceKey = "addItemPreference"

    
    
    
    
    func hasBeenAdded() {
        UserDefaults.standard.set(true, forKey: .addItemKey )
    }
    
    
    
   
    
}
