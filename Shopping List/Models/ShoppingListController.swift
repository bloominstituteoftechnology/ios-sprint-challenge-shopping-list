//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by Ian French on 5/3/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation


class ShoppingController {

 let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]

var shopList: [ShopList] = []

var foods: [ShopList] {
    
    return shopList.filter{$0.itemAdd == true}
    

}
   
     var shopListURL: URL? {
                 let fm = FileManager.default
             
                 guard let directory = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
             
              
              let shopListURL = directory.appendingPathComponent("ShoppingList.plist")
              return shopListURL
             }
    
    func saveToPersistentStore() {
                
                  do {
                    guard let url = shopListURL else { return }

                    let encoder = PropertyListEncoder()
                    let shopData = try encoder.encode(shopList)
                    try shopData.write(to: url)
                } catch {
                    NSLog("Error saving books data: \(error)")
                }
            }
    
    
    
    func loadFromPersistentStore() {
                 
                   do {
                      let fm = FileManager.default
                      guard let url = shopListURL,
                      fm.fileExists(atPath: url.path) else { return }
                 
               
                     let data = try Data(contentsOf: url)
                     let decoder = PropertyListDecoder()
                     let decodedItems = try decoder.decode([ShopList].self, from: data)
                     shopList = decodedItems
                 } catch {
                     NSLog("Error loading books data: \(error)")
                 }
             }
    
    
    
    
    
      
    func addItem(item: ShopList, addItem: Bool){
        guard let itemIndex = foods.firstIndex(of: item) else
        { return }
    }

    
    
    
    
    
    
    
    
    
}












