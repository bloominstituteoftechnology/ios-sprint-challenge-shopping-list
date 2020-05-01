//
//  ShoppingListModelController.swift
//  Shopping List
//
//  Created by Kelson Hartle on 4/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemsCollectionViewController: UICollectionViewController {
    
    
    let shoppingListController = ShoppingModelController()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        collectionView?.reloadData()
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return shoppingListController.shoppingItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath) as? ItemCollectionViewCell else { fatalError("You have the wrong identifier")}
    
        let item = shoppingListController.shoppingItems[indexPath.item]
    
        cell.shoppingItem = item
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        shoppingListController.shoppingItems[indexPath.item].itemHasBeenAdded.toggle()
}
  
    
}
