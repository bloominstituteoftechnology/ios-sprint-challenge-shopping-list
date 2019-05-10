//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Steven Leyva on 5/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit


class ShoppingListCollectionViewController: UICollectionViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    // MARK: - Navigation
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        
        if segue.identifier == "ShoppingListDetail" {
            guard let shoppingListDetailVC = segue.destination as? ShoppingListDetailViewController,
                let indexPath = collectionView?.indexPathsForSelectedItems?.first else { return }
            let shoppingList = shoppingListController.shoppingLists[indexPath.item]
            
            shoppingListDetailVC.shoppingListController = shoppingListController
            
            
        }
        
        // MARK: UICollectionViewDataSource
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return shoppingListController.shoppingLists.count
        }
        
        let reuseIdentifier = "ShoppingListCell"
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ShoppingListCollectionViewCell
            
            let shoppingList = shoppingListController.shoppingLists[indexPath.item]
            cell.shoppingListNameLabel.text = shoppingList.title
            cell.shoppingListImageView.image = shoppingList.imageData
           
            
            return cell
            
        }
 
    
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let shoppingItem = shoppingListController.notAddedShoppingItem[indexPath.item]
        
        
        shoppingListController
        .updateHasBeenAdded(shoppingList: shoppingItem)
    }
    
let shoppingListController = ShoppingListController()
    
}
