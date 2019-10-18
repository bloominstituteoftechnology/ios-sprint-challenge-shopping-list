//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Brandi on 10/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController: Codable {
        
    var itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]

        
        // MARK: - Private Methods
        
        private func loadFromPersisitentStore() {
            
            do {
                guard let fileURL = shoppingListURL else { return }
                
                let shoppingListData = try Data(contentsOf: fileURL)
                let plistDecoder = PropertyListDecoder()
                
                shoppingItems = try plistDecoder.decode([ShoppingItem].self, from: shoppingListData)
            } catch {
                print("Could not load Shopping List: \(error)")
            }
        }
        
        private func saveToPersistentStore() {
            
            let plistEncoder = PropertyListEncoder()
            
            do {
                let shoppingListData = try plistEncoder.encode(shoppingItems)
                
                guard let fileURL = shoppingListURL else { return }
                
                try shoppingListData.write(to: fileURL)
            } catch {
                print("Could not save Shopping List: \(error)")
            }
            
        }
        
        // MARK: - Properties
        
    private var shoppingListURL: URL? {
    let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
            
            let fileName = "ShoppingList.plist"
            
            return documentDirectory?.appendingPathComponent(fileName)
        }
        
        private(set)  var shoppingItems: [ShoppingItem] = []

}
