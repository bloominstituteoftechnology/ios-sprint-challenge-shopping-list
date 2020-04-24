//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Enzo Jimenez-Soto on 4/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ShoppingListCell"

class ShoppingListCollectionViewController: UICollectionViewController {
   
    var shoppingItemController = ShoppingItemController()
    

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let shoppingItem = shoppingItemController.shoppingItems[indexPath.item]
        shoppingItemController.update(shoppingItem: shoppingItem, isAdded: !shoppingItem.isAdded)
        collectionView.reloadData()
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingItemController.shoppingItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingListCell", for: indexPath) as? ShoppingListCollectionViewCell else { return UICollectionViewCell() }
    
        cell.shoppingItem = shoppingItemController.shoppingItems[indexPath.item]
    
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "OrderSegue" {
            if let orderVC = segue.destination as? OrderViewController {
                orderVC.shoppingItemController = shoppingItemController
            }
        }
    }
}
