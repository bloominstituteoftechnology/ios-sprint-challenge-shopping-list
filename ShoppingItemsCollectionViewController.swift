//
//  ShoppingItemsCollectionViewController.swift
//  Shopping List
//
//  Created by Kelson Hartle on 4/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemsCollectionViewController: UICollectionViewController {
    
    let shoppingListController = ShoppingList()

    override func viewDidLoad() {
        super.viewDidLoad()

    }


    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return shoppingListController.items.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath) as? ItemCollectionViewCell else { fatalError("You have the wrong identifier")}
    
        let item = shoppingListController.items[indexPath.item]
    
        cell.shoppingItem = item
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let itemSelected = shoppingListController.items[indexPath.item]
        
        if itemSelected.itemHasBeenAdded {
            
        }
    }
    

   //MARK: - Persistence
       
       var persistentFileURL: URL? {
           
           let fileManager = FileManager.default
           let documentsDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
           
           let itemsURL = documentsDir?.appendingPathComponent("item.plist")
           
           return itemsURL
           
       }
       
       func saveToPersistentStore() {
           
           do {
               
               let encoder = PropertyListEncoder()
               
               let itemsPlist = try encoder.encode()
               
               guard let persistenFileURL = persistentFileURL else { return }
               
               try itemsPlist.write(to: persistenFileURL)
               
           } catch {
               
               print("error saving stars: \(error)")
               
           }
       }
       
       func loadFromPersistentStore() {
           
           guard let persistenFileURL = persistentFileURL else { return }
           
           do {
               
               let decoder = PropertyListDecoder()
               
               let itemsPlist = try Data(contentsOf: persistenFileURL)
               
               let items = try decoder.decode( [ShoppingItem].self, from: itemsPlist)
               
               self.itemNames = items
               
           } catch {
               print("Error loading items from plist \(error)")
               
           }
       }
    
    func setAddedOrNot() {
        
        guard let currentStatus = shoppingListController.addedOrNot else { return }
        
        switch currentStatus {
            
        case "Not Added":
            
            
        }
    }
   }


