//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Harmony Radley on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit


class ShoppingListCollectionViewController: UICollectionViewController {

    let shoppingListController = ShoppingListController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
    }
    

    // MARK: UICollectionViewDataSource


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingListController.itemNames.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as? ItemCollectionViewCell else { return UICollectionViewCell() }
    
        let item = shoppingListController.itemNames[indexPath.item]
        
        cell.item = item
    
        return cell
    }

    
    // MARK: - Persistence
     
        var shoppingListURL: URL? {
            
            let fileManager = FileManager.default
            
            let documentsDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
            
            let itemsURL = documentsDir?.appendingPathComponent("ShoppingList.plist")
            
            return itemsURL
        }
        
     
     func saveToPersistentStore() {
         
         let encoder = PropertyListEncoder()
         
         do {
             
             let itemsData = try encoder.encode(shoppingListURL)
             
             guard let itemsURL = shoppingListURL else { return }
             
             try itemsData.write(to: itemsURL)
             
         } catch {
             
             print("Unable to save item(s) to plist: \(error)")
         }
         
     }
    
    func loadFromPersistentStore() {
        guard let itemsURL = shoppingListURL else { return }
        do {
            let itemsData = try Data(contentsOf: itemsURL)
            items = try PropertyListDecoder().decode([ShoppingItem], from: itemsData)
        } catch {
            print("Error decoding items: \(error)")
        }
    }
    

}
