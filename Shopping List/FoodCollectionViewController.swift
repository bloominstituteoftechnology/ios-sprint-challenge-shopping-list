//
//  FoodCollectionViewController.swift
//  Shopping List
//
//  Created by Anesa Krnic on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class FoodCollectionViewController: UICollectionViewController {
    
    var shoppingList: [ShoppingItem] = []
    let ShoppingItemKey = "ShoppingItemKey"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let items = self.retrieveItems() {
            shoppingList = items
        } else {
            shoppingList = [
                ShoppingItem(name: "Apple", imageName: "apple", added: true),
                ShoppingItem(name: "Grapes", imageName: "grapes", added: true),
                ShoppingItem(name: "Milk", imageName: "milk", added: true),
                ShoppingItem(name: "Muffin", imageName: "muffin", added: true),
                ShoppingItem(name: "Popcorn", imageName: "popcorn", added: true),
                ShoppingItem(name: "Soda", imageName: "soda", added: true),
                ShoppingItem(name: "Strawberries", imageName: "strawberries", added: true)
            ]
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            let detailsViewController = segue.destination as! ViewController
            detailsViewController.numberOfItems = shoppingList.filter({$0.added}).count
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingList.count
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FoodCell", for: indexPath) as! FoodCollectionViewCell
        
        let foodItem = shoppingList[indexPath.item]
        
        cell.itemNameLabel.text = foodItem.name
        cell.imageView.image = UIImage.init(named: foodItem.imageName)
        cell.notAddedLabel.text = foodItem.added ? "Added" : "Not added"
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let foodItem = shoppingList[indexPath.item]
        foodItem.added = !foodItem.added
        
        self.storeItems(shoppingList)
        collectionView.reloadItems(at: [indexPath])
    }
    
    func storeItems(_ items: [ShoppingItem]) {
        do {
            let data = try PropertyListEncoder().encode(items)
            UserDefaults.standard.set(data, forKey: ShoppingItemKey)
        } catch {
            print("Save Failed")
        }
    }
    
    func retrieveItems() -> [ShoppingItem]? {
        if let archivedData = UserDefaults.standard.value(forKey: ShoppingItemKey) as? Data {
            do {
                let items = try PropertyListDecoder().decode([ShoppingItem].self, from: archivedData)
                return items
            } catch {
                print("Retrieve Failed")
                return nil
            }
        }
        return nil
    }
}
