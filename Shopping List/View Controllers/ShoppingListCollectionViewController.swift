//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Lisa Sampson on 8/10/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ShoppingCell"

class ShoppingListCollectionViewController: UICollectionViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        collectionView?.reloadData()
    }

    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingItemController.shoppingItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ShoppingListCollectionViewCell else { return UICollectionViewCell() }
    
        let shoppingItem = shoppingItemController.shoppingItems[indexPath.item]
        cell.itemImage.image = UIImage(named: shoppingItem.image)
        cell.itemLabel.text = shoppingItem.item
        cell.isAddedLabel.text = String(shoppingItem.isAdded)
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let index = collectionView.indexPathsForSelectedItems?.first?.item else { return }
        let shoppingItem = shoppingItemController.shoppingItems[index]
        shoppingItemController.updateIsAdded(shoppingItem: shoppingItem)
        
        collectionView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? OrderingViewController else { return }
        detailVC.shoppingItemController = shoppingItemController
    }
    
    var shoppingItemController = ShoppingItemController()
    
}
