//
//  ShoppingList.swift
//  Shopping List
//
//  Created by Lambda_School_Loaner_167 on 8/24/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//


import UIKit


class ShoppingListController: Codable {
    
    var shoppingListItem: [ShoppingListItem] = []
    
    var addedItems: [ShoppingListItem] {
        return shoppingListItem.filter{ $0.hasBeenAdded == true }
    }
    
    var nameOfShoppingItems = ["Apples", "Grapes", "Milk", "muffin", "Popcorn", "Soda",  "Strawberries"]
    
    let initKey = "initalizeKey"
    private(set) var initalizeChecker: Bool?
     
    init(){
        initalizeChecker = UserDefaults.standard.bool(forKey: initKey)
        for item in nameOfShoppingItems {
            if UIImage(named: item) != nil {
                let pictureData = ShoppingListItem(imageName: item, itemName: item, hasBeenAdded: false)
                shoppingListItem.append(pictureData)
            }
            
            UserDefaults.standard.set(true, forKey: initKey)
            
        }
    }
    
    private var shoppingListURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil}
        print("Documents: \(documents.path)")
        return documents.appendingPathComponent("shopping.plist")
    }
    
    private func saveToPersistentStore() {
        guard let url = shoppingListURL else { return }
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(shoppingListItem)
            try data.write(to: url)
        } catch {
            NSLog("Error saving Shopping List Data: \(error)")
        }
    }
    
     func loadFromPersistentStore() {
        let fm = FileManager.default
        guard let url = shoppingListURL else {return}
        fm.fileExists(atPath: url.path)
    
        do {
            let decoder = PropertyListDecoder()
            let data = try Data(contentsOf: url)
            shoppingListItem = try decoder.decode([ShoppingListItem].self, from: data)
        } catch {
            print("Error loading List data: \(error)")
        }
    }
    
    func updateStatus(item: ShoppingListItem) {
        guard let statusUpdate = shoppingListItem.firstIndex(of: item) else { return }
        shoppingListItem[statusUpdate].hasBeenAdded = !shoppingListItem[statusUpdate].hasBeenAdded
        saveToPersistentStore()
    }
    
}
