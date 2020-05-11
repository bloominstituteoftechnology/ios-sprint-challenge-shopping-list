//
//  shoppingModel.swift
//  Shopping List
//
//  Created by Lambda_School_Loaner_268 on 1/31/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation


class ShoppingItem {
    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]

    var itemName: String
    var inList: Bool
    var generateUIImage: NSObject {
        var a = NSObject.init()
        return a
        
        
    }
    init(itemName: String) {
        self.itemName = itemName
        self.inList = true
        self.generateUIImage = generateUIImage(named: self.itemName)
        fileManager = FileManager()
        
        fileManager.
    }
}
