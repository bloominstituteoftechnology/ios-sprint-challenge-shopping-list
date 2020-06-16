//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Cora Jacobson on 6/13/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewController: UICollectionViewController {

    let shoppingItemController = ShoppingItemController()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }


    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "orderDetailShowSegue" {
            if let orderDetailVC = segue.destination as? OrderDetailViewController {
                orderDetailVC.shoppingItemController = shoppingItemController
            }
        }
    }


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return shoppingItemController.addedItems.count
        } else {
            return shoppingItemController.unaddedItems.count
        }
    }
    
    func itemFor(indexPath: IndexPath) -> ShoppingItem {
        if indexPath.section == 0 {
            return shoppingItemController.addedItems[indexPath.item]
        } else {
            return shoppingItemController.unaddedItems[indexPath.item]
        }
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath) as? ShoppingListCollectionViewCell else { return UICollectionViewCell() }
        cell.item = itemFor(indexPath: indexPath)
        return cell
    }

    
    
    // MARK: UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = itemFor(indexPath: indexPath)
        if let itemIndex = shoppingItemController.shoppingItems.firstIndex(of: item) {
            shoppingItemController.shoppingItems[itemIndex].addedToList.toggle()
        }
        shoppingItemController.itemWasUpdated()
        collectionView.reloadData()
    }
    
}
