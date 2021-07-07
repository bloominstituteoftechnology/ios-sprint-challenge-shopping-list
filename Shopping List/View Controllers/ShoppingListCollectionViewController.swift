//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Lisa Sampson on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ItemCell"

class ShoppingListCollectionViewController: UICollectionViewController {
    
    // MARK: - Properties
    var shoppingController = ShoppingItemController()

    // MARK: - View Loading Methods

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        collectionView?.reloadData()
    }
    
    // MARK: - Added/Not Added Methods
    
    func itemFor(indexPath: IndexPath) -> ShoppingItem {
        if indexPath.section == 0 {
            return shoppingController.addedItem[indexPath.item]
        } else {
            return shoppingController.notAddedItem[indexPath.item]
        }
    }

    // MARK: UICollectionViewDataSource
    
    

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 2
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
//        if section == 0 {
//            return shoppingController.addedItem.count
//        } else {
//            return shoppingController.notAddedItem.count
//        }
        return shoppingController.shoppingItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ShoppingItemCollectionViewCell else { return UICollectionViewCell() }
    
        let shoppingItem = shoppingController.shoppingItems[indexPath.item]
//        let shoppingItem = itemFor(indexPath: indexPath)
        cell.shoppingItem = shoppingItem
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let index = collectionView.indexPathsForSelectedItems?.first?.item else { return }
        let shoppingItem = shoppingController.shoppingItems[index]
        shoppingController.updateIsAdded(shoppingItem: shoppingItem)
        
        collectionView.reloadData()
    }

    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? OrderingViewController else { return }
        detailVC.shoppingController = shoppingController
    }

}
