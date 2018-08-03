//
//  ShoppingController.swift
//  Shopping List
//
//  Created by Conner on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit
import Foundation

class ShoppingController {
    
    func shoppingItemAddedToList(for shoppingItem: ShoppingItem) {
        guard let index = shoppingItems.index(of: shoppingItem) else { return }
        shoppingItems[index].addedToList.toggle()
    }
    
    var inShoppingList: [ShoppingItem] {
        return shoppingItems.filter { $0.addedToList }
    }
    
    var notInShoppingList: [ShoppingItem] {
        return shoppingItems.filter {!$0.addedToList}
    }
    
    var shoppingListURL: URL? {
        let fm = FileManager.default
        guard let documentDir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return documentDir.appendingPathComponent("ShoppingList.plist")
    }

    private(set) var shoppingItems: [ShoppingItem] = [
        ShoppingItem(image: UIImage(named: "apple"), name: "apple", addedToList: false),
        ShoppingItem(image: UIImage(named: "grapes"), name: "grapes", addedToList: false),
        ShoppingItem(image: UIImage(named: "milk"), name: "milk", addedToList: false),
        ShoppingItem(image: UIImage(named: "muffin"), name: "muffin", addedToList: false),
        ShoppingItem(image: UIImage(named: "popcorn"), name: "popcorn", addedToList: false),
        ShoppingItem(image: UIImage(named: "soda"), name: "soda", addedToList: false),
        ShoppingItem(image: UIImage(named: "strawberries"), name: "strawberries", addedToList: false),
    ]
}
