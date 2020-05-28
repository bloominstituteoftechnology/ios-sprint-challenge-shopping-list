//
//  FoodMenuCollectionViewController.swift
//  Shopping List
//
//  Created by Bryan Cress on 5/22/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit


class FoodMenuCollectionViewController: UICollectionViewController {
    
    let shoppingItemController = ShoppingItemController()
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CheckoutSegue" {
            guard let destination = segue.destination as? OrderSubmitterViewController else { return }
            destination.shoppingList = shoppingItemController
        }
    }
    
    // MARK: - UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingItemController.shoppingItems.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingItemCell", for: indexPath) as? ShoppingItemCollectionViewCell else { return UICollectionViewCell() }
        let item = shoppingItemController.shoppingItems[indexPath.item]
        cell.shoppingItem = item
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var item = shoppingItemController.shoppingItems[indexPath.item]
        item.addedToCart.toggle()
        shoppingItemController.shoppingItems[indexPath.item] = item
        shoppingItemController.saveToPersistentStore()
        collectionView.reloadData()
    }
}
