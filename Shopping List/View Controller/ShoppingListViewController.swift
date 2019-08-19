//
//  ShoppingList.swift
//  Shopping List
//
//  Created by Vici Shaweddy on 8/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class ShoppingListViewController: UICollectionViewController {
    var items: [ShoppingItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // initialize the new shopping items once
        let didInitialize = UserDefaults.standard.bool(forKey: String.didInitializeKey)
        if !didInitialize {
            initializeOnce()
            UserDefaults.standard.set(true, forKey: String.didInitializeKey)
        } else {
            loadShoppingList()
        }
    }
    
    private var shoppingListURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return nil }
        
        return documents.appendingPathComponent("ShoppingList.plist")
    }
    
    private func initializeOnce() {
        let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    
        for item in itemNames {
            items.append(ShoppingItem(itemName: item, hasBeenAdded: false))
        }
        
        guard let url = shoppingListURL else { return }
        do {
            let encoder = PropertyListEncoder()
            let shoppingData = try encoder.encode(items)
            try shoppingData.write(to: url)
        } catch {
            // handle error
            print("Error")
        }
    }
    
    private func loadShoppingList() {
        let fileManager = FileManager.default
        guard let url = shoppingListURL, fileManager.fileExists(atPath: url.path) else { return }
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            let decodeShoppingList = try decoder.decode([ShoppingItem].self, from: data)
            items = decodeShoppingList
        } catch {
            print("Error")
        }
    }
    
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as? ShoppingItemCollectionViewCell else { return UICollectionViewCell() }
        
        let item = items[indexPath.item]
        cell.imageView.image = UIImage(named: "\(item.itemName)")
        cell.textLabel.text = item.hasBeenAdded ? "Added" : "Not Added"
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
        var item = items[indexPath.item]
        
        item.hasBeenAdded.toggle()
        items[indexPath.item] = item
        collectionView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailSegue" {
            guard let detailVC = segue.destination as? DetailViewController else { return }
            
            detailVC.items = self.items
        }
    }
}

