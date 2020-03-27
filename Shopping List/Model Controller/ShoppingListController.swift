//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by Michael on 12/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingListController {
    
    var shoppingList: [ShoppingList] = [ShoppingList(itemName: "Apple", itemAdded: false, imageName: "Apple"),
                                        ShoppingList(itemName: "Grapes", itemAdded: false, imageName: "Grapes"),
                                        ShoppingList(itemName: "Milk", itemAdded: false, imageName: "Milk"),
                                        ShoppingList(itemName: "Muffin", itemAdded: false, imageName: "Muffin"),
                                        ShoppingList(itemName: "Popcorn", itemAdded: false, imageName: "Popcorn"),
                                        ShoppingList(itemName: "Soda", itemAdded: false, imageName: "Soda"),
                                        ShoppingList(itemName: "Strawberries", itemAdded: false, imageName: "Strawberries")]

    func itemAdded(item: ShoppingList) {
        guard let itemAdded = shoppingList.firstIndex(of: item) else { return }
        shoppingList[itemAdded].itemAdded = !shoppingList[itemAdded].itemAdded
        
    }
    
//    var persistentFileURL: URL? {
//        let fileManager = FileManager.default
//
//        // Go to the documents directory of our app.
//        guard let documentsDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
//
//        let shoppingListURL = documentsDir.appendingPathComponent("shoppingList.plist")
//
//        return shoppingListURL
//    }
//
//    func saveToPersistentStore() {
//        // Make sure the fileURL exists, otherwise we can't save the stars there.
//        guard let fileURL = persistentFileURL else { return }
//
//        do {
//
//            let encoder = PropertyListEncoder()
//
//            let shoppingListData = try encoder.encode(shoppingList)
//
//            try shoppingListData.write(to: fileURL)
//        } catch {
//            print("Error saving stars: \(error)")
//        }
//
//    }
//
//    func loadFromPersistentStore() {
//
//            guard let fileURL = persistentFileURL else { return }
//
//            do {
//
//                let shoppingListData = try Data(contentsOf: fileURL)
//
//                let decoder = PropertyListDecoder()
//
//                let shoppingListArray = try decoder.decode([ShoppingList].self, from: shoppingListData)
//
//                self.shoppingList = shoppingListArray
//            } catch {
//                print("Error loading shoppingList from plist: \(error)")
//        }
//    }
}
    

