//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Sameera Roussi on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "GroceryCell"

class ShoppingListCollectionViewController: UICollectionViewController {
    
    // MARK: - Properties
    
    let shoppingListController = ShoppingListController()
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        collectionView?.reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingListController.groceries.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GroceryCell", for: indexPath) as! ShoppingListCollectionViewCell
        
        let shoppingItem = shoppingListController.groceries[indexPath.item]
        
        cell.itemView.image = shoppingItem.
        cell.imageView.image = planet.image
        
        return cell
    }
  
}
