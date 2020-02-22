//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by True Ballin on 2/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItem {
    var popcorn: String
    var soda: String
    var milk: String
    var muffin: String
    var apple: String
    var hasBeenAdded: Bool
    
    init(popcorn:String, soda: String, milk: String, muffin: String, apple: String, hasBeenAdded: Bool) {
        self.popcorn = popcorn
        self.soda = soda
        self.milk = milk
        self.muffin = muffin
        self.apple = apple
        self.hasBeenAdded = false
    }
}


