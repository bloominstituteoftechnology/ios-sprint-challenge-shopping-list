//
//  ShoppingCollectionViewController.swift
//  Shopping List
//
//  Created by Harmony Radley on 3/5/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit


class ShoppingCollectionViewController: UICollectionViewController {

        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            collectionView?.reloadData()
        }
        
        
        // MARK: UICollectionViewDataSource
        
        
        override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return shoppingListController.itemNames.count
        }
        
        override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as? ShoppingCollectionViewCell else { return UICollectionViewCell() }
            
            let item = shoppingListController.itemNames[indexPath.item]
            //cell.shoppingItem = item
        
            
            return cell
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
            if segue.identifier == "SendOrderSegue" {
                guard let itemsDetailVC = segue.destination as? DetailListViewController else { return }
                itemsDetailVC.shoppingContoller = self.shoppingListController
            }
        }
        
        
        // MARK: - UICollectionViewDelegate
        
        override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
            
            
            let item = shoppingListController.itemNames[indexPath.item]
           
            shoppingListController.itemNames[indexPath.item] = item
            collectionView.reloadData()
            return true
            
        }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        seg
    }
    var shoppingListController = ShoppingListController()
}
