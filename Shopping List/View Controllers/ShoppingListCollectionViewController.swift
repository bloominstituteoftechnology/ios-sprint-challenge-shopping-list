//
//  ShoppingLIstCollectionViewController.swift
//  Shopping List
//
//  Created by Paul Yi on 1/25/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewController: UICollectionViewController {
    var shoppingItemController = ShoppingItemController()

    
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

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingItemController.shoppingItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as!
            ShoppingItemCollectionViewCell
    
        let shoppingItem = shoppingItemController.shoppingItems[indexPath.item]
        cell.shoppingItem = shoppingItem
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = indexPath.item
        let shoppingItem = shoppingItemController.shoppingItems[index]
        shoppingItemController.updateIsAdded(for: shoppingItem)
        
        collectionView.reloadData()
    }
}
