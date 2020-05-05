//
//  ShoppingItemCollectionViewController.swift
//  Shopping List
//
//  Created by Aaron Peterson on 5/4/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewController: UICollectionViewController, CellSelectionDelegate {
    
    func updateIsAddedLabel(cell: ShoppingItemCollectionViewCell) {
        guard let indexPath = collectionView?.indexPath(for: cell) else { return }
        let shoppingItem = shoppingItemController.shoppingItems[indexPath.item]
        if shoppingItem.isAdded == true {
            cell.isAddedButton.setTitle("Added", for: .normal)
        } else {
            cell.isAddedButton.setTitle("Not Added", for: .normal)
        }
        
        collectionView?.reloadData()
    }
    
    
    let shoppingItemController = ShoppingItemController()

    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return shoppingItemController.shoppingItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingItemCell", for: indexPath) as? ShoppingItemCollectionViewCell else { return UICollectionViewCell() }
    
        let shoppingItem = shoppingItemController.shoppingItems[indexPath.item]
        cell.shoppingItemImageView.image = shoppingItem.image
        cell.shoppingItemLabel.text = shoppingItem.name
        
        cell.delegate = self
        
        if shoppingItem.isAdded == true {
            cell.isAddedButton.setTitle("Added", for: .normal)
        } else {
            cell.isAddedButton.setTitle("Not Added", for: .normal)
        }
    
        return cell
    }

    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        var shoppingItem = shoppingItemController.shoppingItems[indexPath.item]
        shoppingItem.isAdded = !shoppingItem.isAdded
        print(shoppingItem.isAdded)
        
        //collectionView.reloadData()
        
    }

}
