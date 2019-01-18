//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Moses Robinson on 1/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewController: UICollectionViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
        collectionView.delegate = self
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            guard let detailShoppingListVC = segue.destination as? ShoppingListDetailViewController else { return }
            detailShoppingListVC.shoppingListController = shoppingItemController
        }
    }
 
    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return shoppingItemController.shoppingList.count
    }

    let reuseIdentifier = "ShoppingItemCell"
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ShoppingItemCollectionViewCell
    
        let shoppingItem = shoppingItemController.shoppingList[indexPath.item]
        cell.shoppingItem = shoppingItem
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let shoppingItem = shoppingItemController.shoppingList[indexPath.item]
        shoppingItemController.updateIsAdded(shoppingItem: shoppingItem)
        
        collectionView.reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let shoppingItem = shoppingItemController.shoppingList[indexPath.item]
        shoppingItemController.updateIsAdded(shoppingItem: shoppingItem)
        
        collectionView.reloadData()
    }
    
    //MARK: - Properties
    
    let shoppingItemController = ShoppingItemController()

}
