//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Richard Gibbs on 5/25/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit


class ShoppingListCollectionViewController: UICollectionViewController {
    
    var shoppingItemController = ShoppingItemController()
    var shoppingListDetailViewController = ShoppingListDetailViewController()
    var shoppingItemCollectionViewCell = ShoppingItemCollectionViewCell()
   
   
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShoppingListDetailSegue" {
            let shoppingListDetailVC = segue.destination as? ShoppingListDetailViewController
            shoppingListDetailVC?.shoppingItemController = shoppingItemController
            return
        }
    }
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return shoppingItemController.items.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingItemCell", for: indexPath) as? ShoppingItemCollectionViewCell else {
            fatalError("Collection view cell identifier is wrong or the cell is not a ShoppingItemCollectionViewCell")
        }
        
        // Configure the cell                                       spot 13
        let shoppingListItem = shoppingItemController.items[indexPath.item]
        //shopping item to shopping item
        cell.item = shoppingListItem
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var chosenItem = shoppingItemController.items[indexPath.item]
        chosenItem.added.toggle()
        shoppingItemController.items[indexPath.item] = chosenItem
        shoppingItemController.saveToPersistentStore()
        collectionView.reloadData()
//        let cell = collectionView.cellForItem(at: indexPath) as! ShoppingItemCollectionViewCell
//        let chosenItem = shoppingItemController.items[indexPath.item]
//        cell.item = chosenItem
        
            
        
    }
    
    
    
}
 
