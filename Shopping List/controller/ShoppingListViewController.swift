//
//  ShoppingListViewController.swift
//  Shopping List
//
//  Created by Vincent Hoang on 4/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListViewController: UICollectionViewController, ShoppingItemViewCellDelegate {
    let shoppingListController = ShoppingListController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
            }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingListController.shoppingList.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "shoppingListViewCell", for: indexPath) as? ShoppingItemViewCell else {
            fatalError("Dequeued cell is not an instance of ShoppingItemViewCell")
        }
        
        cell.item = shoppingListController.shoppingList[indexPath.row]
        cell.delegate = self
        
        return cell
    }
    
    func toggleAddToCart(for cell: ShoppingItemViewCell) {
        guard let indexPath = collectionView?.indexPath(for: cell) else {
            return
        }
        
        let currentStatus = shoppingListController.shoppingList[indexPath.row].isAddedToShoppingList
        
        shoppingListController.shoppingList[indexPath.row].isAddedToShoppingList = !currentStatus
        
        shoppingListController.saveToPersistentStore()
        
        collectionView?.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        switch segue.identifier ?? "" {
        case "showCartSegue":
            guard let shoppingCartViewController = segue.destination as? ShoppingCartViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            shoppingCartViewController.controller = shoppingListController
        default:
            fatalError("No segue identifer available")
        }
    }
}
