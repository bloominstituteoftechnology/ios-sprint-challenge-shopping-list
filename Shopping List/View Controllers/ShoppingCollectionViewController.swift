//
//  ShoppingCollectionViewController.swift
//  Shopping List
//
//  Created by Harmony Radley on 3/5/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit


class ShoppingCollectionViewController: UICollectionViewController {
    var shoppingListController = ShoppingListController()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        collectionView?.reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingListController.itemNames.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as? ShoppingCollectionViewCell else { return UICollectionViewCell() }
        let item = shoppingListController.itemNames[indexPath.item]
        cell.item = item
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        shoppingListController.updateAddedItem(for: shoppingListController.itemNames[indexPath.item])
        collectionView.reloadData()
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "SendOrderSegue" {
            guard let itemsDetailVC = segue.destination as? ItemsDetailViewController else { return }
            itemsDetailVC.shoppingListController = self.shoppingListController
        }
    }
}


