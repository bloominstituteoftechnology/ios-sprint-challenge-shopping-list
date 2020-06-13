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
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingItemController.shoppingItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath) as? ShoppingListCollectionViewCell else { return UICollectionViewCell() }
        cell.item = shoppingItemController.shoppingItems[indexPath.item]
        return cell
    }

    // MARK: UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        shoppingItemController.shoppingItems[indexPath.item].addedToList.toggle()
        shoppingItemController.itemWasUpdated()
        collectionView.reloadData()
    }
    
}
