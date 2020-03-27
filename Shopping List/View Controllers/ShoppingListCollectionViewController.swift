//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Hunter Oppel on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewController: UICollectionViewController {
    
    // MARK: Properties
    
    var shoppingController = ShoppingListController()
    
    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.reloadData()
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowSubmitOrder" {
            guard let submitOrderVC = segue.destination as? SubmitOrderViewController else {return}
            
            submitOrderVC.shoppingController = shoppingController
        }
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingController.shoppingList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GroceryCell", for: indexPath) as? ShoppingListCollectionViewCell else {
            fatalError("Cell did not return as ShoppingListCollectionCell")
        }
    
        cell.shoppingItem = shoppingController.shoppingList[indexPath.row]
        
        return cell
    }

    // MARK: UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? ShoppingListCollectionViewCell else {
            fatalError("Cell did not return as ShoppingListCollectionCell")
        }
        shoppingController.updateItem(item: shoppingController.shoppingList[indexPath.row])
        cell.shoppingItem = shoppingController.shoppingList[indexPath.row]
        shoppingController.saveToPersistentStore()
        collectionView.reloadData()
    }
}
