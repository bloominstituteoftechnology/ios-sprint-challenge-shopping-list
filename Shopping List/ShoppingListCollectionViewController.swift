//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Steven Leyva on 5/3/19.
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
        cell.shoppingList = shoppingList
        
        
            
        return cell
    }
    
        func toggleHasBeenAdded(for cell: ShoppingListCollectionViewCell) {
            guard let indexPath = CollectionView.indexPath(for: cell) else { return }
            let shoppingList = shoppingListFor(indexPath: indexPath)
            shoppingListController.updateHasBeenAdded(shoppinglist: shoppingList)
            collectionView.reloadData()
        }
    //MARK: - Properties
    
    
    
}
    let shoppingListController = ShoppingListController()
}

