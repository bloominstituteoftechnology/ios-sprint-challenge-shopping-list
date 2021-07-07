//
//  ShoppingItemCollectionViewController.swift
//  Shopping List
//
//  Created by Gerardo Hernandez on 1/2/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit


class ShoppingItemCollectionViewController: UICollectionViewController {
    
    // MARK: - Properties
    
    let shoppingListController = ShoppingListController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "OrderSegue",
            let userOrderVC = segue.destination as? UserOrderViewController {
            userOrderVC.itemsAdded = shoppingListController.itemsAdded
            
        }
    }
    
    // MARK: -  UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingListController.shoppingItem.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingItemCell", for: indexPath) as? ShoppingItemCollectionViewCell else { return UICollectionViewCell() }
        
        let item = shoppingListController.shoppingItem[indexPath.item]
        cell.shoppingItem = item
        return cell
    }
    
    
    //MARK: - UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = self.collectionView(collectionView, cellForItemAt: indexPath) as? ShoppingItemCollectionViewCell,
            let item = cell.shoppingItem else { return }
        
        shoppingListController.statusLabelToggle(for: item)
        collectionView.reloadData()
    }
    
}
