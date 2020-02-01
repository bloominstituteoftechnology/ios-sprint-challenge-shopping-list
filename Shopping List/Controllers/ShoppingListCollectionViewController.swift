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
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return shoppingItemController.addedItems.count
        } else {
            return shoppingItemController.notAddedItems.count
        }
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingItemCell", for: indexPath) as? ShoppingItemCollectionViewCell else { return UICollectionViewCell() }
        
        let shoppingItem = getShoppingItem(for: indexPath)
        
        cell.shoppingItem = shoppingItem
        
        return cell
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let shoppingItem = getShoppingItem(for: indexPath)
        shoppingItemController.toggleHasBeenAdded(for: shoppingItem)
        collectionView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetailViewSegue" {
            if let detailVC = segue.destination as? ShoppingItemsDetailViewController {
                detailVC.shoppingItemCount = shoppingItemController.numberOfItemsAdded
            }
            
        }
    }
    
    func getShoppingItem(for indexPath: IndexPath) -> ShoppingItem {
        let shoppingItem: ShoppingItem
        if indexPath.section == 0 {
            shoppingItem = shoppingItemController.addedItems[indexPath.item]
        } else {
            shoppingItem = shoppingItemController.notAddedItems[indexPath.item]
        }
        
        return shoppingItem
    }
    
}
