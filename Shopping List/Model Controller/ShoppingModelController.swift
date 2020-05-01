//
//  ShoppingModelController.swift
//  Shopping List
//
//  Created by Kelson Hartle on 4/29/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation


class ShoppingModelController {
    
    var shoppingItems: [ShoppingItem] {
        
        let itemNames = [
            ShoppingItem(itemName: "Apple", imageName: "Apple"),
            ShoppingItem(itemName: "Grapes", imageName: "Grapes"),
            ShoppingItem(itemName: "Milk", imageName: "Milk"),
            ShoppingItem(itemName: "Muffin", imageName: "Muffin"),
            ShoppingItem(itemName: "Popcorn", imageName: "Popcorn"),
            ShoppingItem(itemName: "Soda", imageName: "Soda"),
            ShoppingItem(itemName: "Strawberries", imageName: "Strawberries")
        ]
        
        
//        UserDefaults.standard.set(itemNames, forKey: "item")
        
        return itemNames
        
    }
    
    
        //MARK: - PERSISTENCE
    
           var itemListURL: URL? {

               let fileManager = FileManager.default
               let documentsDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first

               let itemsURL = documentsDir?.appendingPathComponent("items.plist")

               return itemsURL
           }

           func saveToPersistentStore() {

               do {

                   let encoder = PropertyListEncoder()

                   //Convert the [Book] into a plist
                   let itemsPlist = try encoder.encode(shoppingItems)

                   // Make sure the location we are saving the stars to exists.
                   guard let persistentFileUrl = itemListURL else { return }

                   //Save the plist to the loction we chose
                   try itemsPlist.write(to: persistentFileUrl)


               } catch {

                   print("error saving stars: \(error)")

               }
           }

    }
    
    func loadFromPersistentStore() {
        guard let persistentFileURL = readingListURL  else { return }
        
        do{
            let decoder = PropertyListDecoder()
            //URL -> Data
            
            //Grab the data (books.plist) from the persistentFileURL
            let booksPlist = try Data(contentsOf: persistentFileURL)
            
            //Data -> [Book] // self is refering to [Book] as a template for the decode.
            let decodedBooks = try decoder.decode([Book].self, from: booksPlist)
            
            self.books = decodedBooks
            
        } catch {
            print("Error loading books from plist \(error)")
        }
        
        
    }
}

