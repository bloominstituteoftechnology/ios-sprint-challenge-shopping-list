//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Lambda_School_loaner_226 on 2/22/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewController: UICollectionViewController {

    let shoppingItemController = ShoppingItemController()
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ConfirmDetailShowSegue"
        {
            if let destination = segue.destination as? ConfirmDetailViewController {
                destination.shoppingList = shoppingItemController
            }
        }
    }

    // MARK: - UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingItemController.shoppingListItem.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingListCell", for: indexPath) as? ShoppingListCollectionViewCell else { return UICollectionViewCell() }
        
        let item = shoppingItemController.shoppingListItem[indexPath.item]
        cell.shoppingItem = item
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        var item = shoppingItemController.shoppingListItem[indexPath.item]
        item.hasBeenAdded.toggle()
        shoppingItemController.shoppingListItem[indexPath.item] = item
        shoppingItemController.saveToPersistentStore()
        collectionView.reloadData()
        return true
    }

}
