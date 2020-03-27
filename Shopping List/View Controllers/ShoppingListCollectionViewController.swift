//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Harmony Radley on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit


class ShoppingListCollectionViewController: UICollectionViewController {

 
    let shoppingItemController = ShoppingItemController()


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingItemController.shoppingItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingListCell", for: indexPath) as? ShoppingListCollectionViewCell else { return UICollectionViewCell() }
        let item = shoppingItemController.shoppingItems[indexPath.item]
        cell.shoppingItem = item
        return cell
    }

  
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        var item = shoppingItemController.shoppingItems[indexPath.item]
        item.hasBeenAdded.toggle()
        shoppingItemController.shoppingItems[indexPath.item] = item
        shoppingItemController.saveToPersistentStore()
        collectionView.reloadData()
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addSegue" {
            if let destination = segue.destination as? ShoppingCartViewController {
                destination.shoppingList = shoppingItemController
            }
        }
    }
}
