//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Kat Milton on 6/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {
//    var shoppingItems: [ShoppingItem] {
//        var itemNames = [
//            ShoppingItem(name: "Apple", imageName: "Apple"),
//            ShoppingItem(name: "Grape", imageName: "Grape"),
//            ShoppingItem(name: "Milk", imageName: "Milk"),
//            ShoppingItem(name: "Muffin", imageName: "Muffin"),
//            ShoppingItem(name: "Popcorn", imageName: "Popcorn"),
//            ShoppingItem(name: "Soda", imageName: "Soda"),
//            ShoppingItem(name: "Strawberries", imageName: "Strawberries")
//            ]
//        
//        let shouldBeOnList = UserDefaults.standard.bool(forKey: .shouldBeOnListKey)
//        
//        
//    }
    
    private var shoppingListURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        print("Documents: \(documents.path)")
        return documents.appendingPathComponent("ShoppingItems.plist")
    }
    
    
}
