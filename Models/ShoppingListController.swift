//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by Nick Nguyen on 1/31/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import UIKit


class ShopplingListController {
    
    init() {
       loadFromPersistentStore()
    }
    
    var shoppingLists = [
        
    ShoppingItem(name: "Apple",isAdded: false),
    ShoppingItem(name: "Grapes",isAdded: false),
    ShoppingItem(name: "Milk",isAdded: false),
    ShoppingItem(name: "Muffin",isAdded: false),
    ShoppingItem(name: "Popcorn",isAdded: false),
    ShoppingItem(name: "Soda",isAdded: false),
    ShoppingItem(name: "Strawberries",isAdded: false)
    
    ]
    
    
    func toggle(for index: Int ) {
        shoppingLists[index].isAdded.toggle()
        
         saveToPersistStore()
    }
    
    var shopURL : URL? {
             let fm = FileManager.default
             guard let documentDirectory = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
             let shopURL = documentDirectory.appendingPathComponent("ShoppingList.plist")
             return shopURL
         }
      
      private func saveToPersistStore() {
             guard let fileURL = shopURL else { return }
             do {
                  let encoder = PropertyListEncoder()
                 let shoppingData = try encoder.encode(shoppingLists)
                 try shoppingData.write(to: fileURL)
             } catch  let err {
                 print("Can't save photos.Error : \(err)")
             }
            
         }
         
        private func loadFromPersistentStore() {
             guard let fileURL = shopURL else { return }
             do {
                 let shopData = try Data(contentsOf: fileURL)
                 let decoder = PropertyListDecoder()
                 let decodedShop = try  decoder.decode([ShoppingItem].self, from: shopData)
                 self.shoppingLists = decodedShop
             } catch let err {
                 print("Can't load Data , error: \(err)")
             }
         }
    
    
}
