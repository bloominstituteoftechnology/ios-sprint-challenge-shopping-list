//
//  ShoppingModelController.swift
//  Shopping List
//
//  Created by John McCants on 6/12/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class ShoppingModelController {
    var items : [ShoppingItem] = [
            ShoppingItem(name: "Apple"),
            ShoppingItem(name: "Grapes"),
            ShoppingItem(name: "Milk"),
            ShoppingItem(name: "Muffin"),
            ShoppingItem(name: "Popcorn"),
            ShoppingItem(name: "Soda"),
            ShoppingItem(name: "Strawberries")
    ]
    
        
        var shoppingListURL : URL? {
            let fm = FileManager.default
                   guard let dir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
                   return dir.appendingPathComponent("ShoppingItems.plist")
        }
    
        var addedItems: [ShoppingItem] {
               return items.filter({ $0.added == true })
           }
           
           var unAddedItems: [ShoppingItem] {
               return items.filter({ $0.added == false })
           }
        
        init() {
            loadFromPersistentStore()
        }
        
        //MARK: -Persistence
           
           
           func saveToPersistentStore() {
               guard let url = shoppingListURL else {
                   return
               }
               
               do {
                   
                   let encoder = PropertyListEncoder()
                   let data = try encoder.encode(items)
                   try data.write(to: url)
                   
               } catch {
                   fatalError("Was not able to encode data")
               }
               
           }
           
           private func loadFromPersistentStore() {
               let fm = FileManager.default
               guard let shoppingListURL = shoppingListURL, fm.fileExists(atPath: shoppingListURL.path) else { return
           }
               
               do {
                   let data = try Data(contentsOf: shoppingListURL)
                   let decoder = PropertyListDecoder()
                    items = try decoder.decode([ShoppingItem].self, from: data)
                   print(shoppingListURL)
                   
                   
                   
               } catch {
                   fatalError("No data was saved")
                   
               }
               
           }
//        func updateAdded(for item: ShoppingItem) {
//
//               guard let itemIndex = items.firstIndex(of: item) else { return }
//             items[itemIndex].added = !items[itemIndex].added
//               saveToPersistentStore()
//
//           }
        
//        func createBook(title: String, reasonToRead: String) {
//
//              let book = Book(title: title, reasonToRead: reasonToRead)
//              books.append(book)
//              saveToPersistentStore()
//          }
        
//        func updateBookData(for book: Book, title: String, reasonToRead: String) {
//            guard let bookIndex = books.firstIndex(of: book) else { return }
//
//            var temp = book
//            temp.title = title
//            temp.reasonToRead = reasonToRead
//
//            books.remove(at: bookIndex)
//            books.insert(temp, at: bookIndex)
//
//            saveToPersistentStore()
//        }
        
//        func deleteBook(book: Book) {
//            guard let index = books.firstIndex(of: book) else { return }
//            books.remove(at: index)
//            saveToPersistentStore()
//        }
        
           
    }

