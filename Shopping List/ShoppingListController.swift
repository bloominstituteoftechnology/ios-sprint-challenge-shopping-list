//
//  ModelController.swift
//  Shopping List
//
//  Created by Chris Gonzales on 1/31/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation


class ShoppingListController{
    
    var shoppingListURL: URL?{
        let fileManager = FileManager.default
        let defaultList = shoppingListDefaults()
        guard let documentsDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil}
        let listURL = documentsDir.appendingPathComponent("ShoppingList.plist")
        return listURL
    }
    
    var shoppingItems: [ShoppingItem]{
    let items = [
        ShoppingItem(imageName: "Apple"),
        ShoppingItem(imageName: "Grapes"),
        ShoppingItem(imageName: "Milk"),
        ShoppingItem(imageName: "Muffin"),
        ShoppingItem(imageName: "Popcorn"),
        ShoppingItem(imageName: "Soda"),
        ShoppingItem(imageName: "Strawberries")]
        return items
    }
    
    func update(item: ShoppingItem){
        item.hasBeenAddedToList = !item.hasBeenAddedToList
        saveToPersistentStore()
    }
    
    func saveToPersistentStore(){
          
          guard let shoppingListURL = shoppingListURL else { return }
          
          let encoder = PropertyListEncoder()
          do{
              let listData = try encoder.encode(shoppingItems)
              try listData.write(to: shoppingListURL)
          } catch {
              print("Error encoding books array: \(error)")
          }
      }
      
      func loadFromPersistnetStore (){
          
          guard let shoppingListURL = shoppingListURL else { return }
          
          do{
              let decoder = PropertyListDecoder()
              
              let shoppingListData = try Data(contentsOf: shoppingListURL)
              
              let shoppingListArray = try decoder.decode([ShoppingItem].self, from: shoppingListData)
          } catch{
              print("Error decoding readList: \(error)")
          }
      }
      
      

    
}
