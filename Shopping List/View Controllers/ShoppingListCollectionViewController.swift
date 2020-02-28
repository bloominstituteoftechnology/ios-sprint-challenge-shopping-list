//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Shawn James on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ShoppingListCell"

class ShoppingListCollectionViewController: UICollectionViewController {
    
    // MARK: - Properties
    let shoppingItemController = ShoppingItemController()

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CheckoutSegue" {
            if let destination = segue.destination as? ShoppingCartViewController {
                destination.shoppingList = shoppingItemController
            }
        }
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingItemController.shoppingItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ShoppingListCollectionViewCell else { return UICollectionViewCell() }
        let item = shoppingItemController.shoppingItems[indexPath.item]
        cell.shoppingItem = item
        return cell
    }

    // MARK: UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        var item = shoppingItemController.shoppingItems[indexPath.item]
        item.added.toggle()
        shoppingItemController.shoppingItems[indexPath.item] = item
        shoppingItemController.saveToPersistentStore()
        collectionView.reloadData()
        return true
    }


}
