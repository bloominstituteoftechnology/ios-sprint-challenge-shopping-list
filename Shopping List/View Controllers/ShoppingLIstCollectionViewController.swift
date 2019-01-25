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
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

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
