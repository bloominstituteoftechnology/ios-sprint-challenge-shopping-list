//
//  ShoppingList.swift
//  Shopping List
//
//  Created by Vici Shaweddy on 8/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class ShoppingListViewController: UIViewController {
    var shoppingItems: [ShoppingItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 
        let didInitialize = UserDefaults.standard.bool(forKey: String.didInitializeKey)
        if !didInitialize {
            initializeOnce()
            UserDefaults.standard.set(true, forKey: String.didInitializeKey)
        }
    }
    
    private var shoppingListURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return nil }
        
        return documents.appendingPathComponent("ShoppingList.plist")
        
    }
    
    private func initializeOnce() {
        let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
        
        var items: [ShoppingItem] = []
        for item in itemNames {
            items.append(ShoppingItem(itemName: item, hasBeenAdded: false))
        }
        
        guard let url = shoppingListURL else { return }
        do {
            let encoder = PropertyListEncoder()
            let shoppingData = try encoder.encode(items)
            try shoppingData.write(to: url)
        } catch {
            // handle error
            print("Error")
        }
    }


}
