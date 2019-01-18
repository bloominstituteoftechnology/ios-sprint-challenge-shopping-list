//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Nathanael Youngren on 1/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ShoppingListCollectionViewController: UICollectionViewController, GroceryCollectionViewCellDelegate {
    
    func toggleAdded(for cell: GroceryCollectionViewCell) {
        guard let indexPath = collectionView.indexPath(for: cell) else { return }
        let item = shoppingItemController.shoppingList[indexPath.row]
        shoppingItemController.updateIsAdded(item: item)
        
        UserDefaults.standard.set(item.isAdded, forKey: .isAddedToCartKey)
        
        collectionView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingItemController.shoppingList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GroceryCell", for: indexPath)
        guard let groceryCell = cell as? GroceryCollectionViewCell else { return cell }
        
        let item = shoppingItemController.shoppingList[indexPath.row]
        
        groceryCell.item = item
        groceryCell.delegate = self
    
        return groceryCell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "NextSegue" {
            guard let orderVC = segue.destination as? OrderViewController else { return }
            orderVC.addedItems = addedItems
        }
    }
    
    
    let shoppingItemController = ShoppingItemController()
    
    var addedItems: [ShoppingItem] {
        let addedItems = shoppingItemController.shoppingList.filter({ $0.isAdded == true })
        return addedItems
    }
    
    var notAddedItems: [ShoppingItem] {
        let notAddedItems = shoppingItemController.shoppingList.filter({ $0.isAdded == false })
        return notAddedItems
    }

}
