//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Vuk Radosavljevic on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ShoppingItem"

class ShoppingListCollectionViewController: UICollectionViewController {

    //MARK: - OVERRIDES
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
    }
    
    //MARK: - PROPERTIES
    let shoppingItemController = ShoppingItemController()

    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingItemController.shoppingList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ShoppingItemCollectionViewCell
        let shoppingItem = shoppingItemController.sortedShoppingList[indexPath.item]
        cell.imageView.image = shoppingItem.image
        cell.nameLabel.text = shoppingItem.name
        if shoppingItem.addedToShoppingList {
            cell.addedLabel.text = "Added"
        } else {
            cell.addedLabel.text = "Not Added"
        }
        return cell
    }
    
    //MARK: - UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let shoppingItem = shoppingItemController.shoppingList[indexPath.item]
        shoppingItemController.switchAddedToShoppingList(item: shoppingItem)
        collectionView.reloadData()
    }
    
    
    //MARK: - SEGUES
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "ShowDetails":
            let destinationVC = segue.destination as? DetailsViewController
            destinationVC?.shoppingItemController = shoppingItemController
        case "AddItem":
            let destinationVC = segue.destination as? AddItemViewController
            destinationVC?.shoppingItemController = shoppingItemController
        default:
            break
        }
    }
}
