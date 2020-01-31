//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by scott harris on 1/31/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewController: UICollectionViewController {
    
    var shoppingItemController = ShoppingItemController()
    
    override func viewDidLoad() {
        collectionView?.delegate = self
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingItemController.shoppingItems.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingItemCell", for: indexPath) as? ShoppingItemCollectionViewCell else { return UICollectionViewCell() }
        
        let shoppingItem = shoppingItemController.shoppingItems[indexPath.item]
        
        cell.shoppingItem = shoppingItem
        
        return cell
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let shoppingItem = shoppingItemController.shoppingItems[indexPath.item]
        shoppingItemController.toggleHasBeenAdded(for: shoppingItem)
        if let cell = collectionView.cellForItem(at: indexPath) as? ShoppingItemCollectionViewCell {
            cell.shoppingItem = shoppingItemController.shoppingItems[indexPath.item]
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetailViewSegue" {
            if let detailVC = segue.destination as? ShoppingItemsDetailViewController {
                detailVC.shoppingItemCount = shoppingItemController.numberOfItemsAdded
            }
            
        }
    }
    
}
