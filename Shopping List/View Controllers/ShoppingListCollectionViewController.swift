//
//  ShoppingLIstCollectionViewController.swift
//  Shopping List
//
//  Created by Paul Yi on 1/25/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewController: UICollectionViewController {
    let shoppingItemController = ShoppingItemController()

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? ShoppingDetailViewController else { return }
        
        detailVC.shoppingItemController = shoppingItemController
    }
 
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return shoppingItemController.shoppingItemsOnList.count
        } else {
            return shoppingItemController.shoppingItemsNotOnList.count
        }
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as!
            ShoppingItemCollectionViewCell
    
        let shoppingItem = shoppingItemController.shoppingItems[indexPath.item]
        cell.shoppingItem = shoppingItem
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionElementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CollectionViewSectionHeader", for: indexPath) as! HeaderCollectionReusableView
            if indexPath.section == 0 {
                headerView.headerLabel.text = "Shopping Cart"
                headerView.headerLabel.isEnabled = !shoppingItemController.shoppingItemsOnList.isEmpty
            } else {
                headerView.headerLabel.text = "Items Not On List"
                headerView.headerLabel.isEnabled = !shoppingItemController.shoppingItemsNotOnList.isEmpty
            }
            return headerView
        default: break
        }
        return (UICollectionReusableView())
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let shoppingItem = shoppingItemFor(indexPath)
        shoppingItemController.toggleIsOnList(for: shoppingItem)
        collectionView.reloadData()
    }
    
    private func shoppingItemFor(_ indexPath: IndexPath) -> ShoppingItem {
        if indexPath.section == 0 {
            return shoppingItemController.shoppingItemsOnList[indexPath.item]
        } else {
            return shoppingItemController.shoppingItemsNotOnList[indexPath.item]
        }
    }
}
