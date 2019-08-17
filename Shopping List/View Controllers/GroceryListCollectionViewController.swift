//
//  GroceryListCollectionViewController.swift
//  Shopping List
//
//  Created by John Kouris on 8/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class GroceryListCollectionViewController: UICollectionViewController {
    
    let shoppingItemController = ShoppingItemController()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        collectionView?.reloadData()
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowOrderSegue" {
            guard let destinationVC = segue.destination as? ShoppingListDetailViewController else { return }
            destinationVC.shoppingItemController = shoppingItemController
            destinationVC.shoppingItems = shoppingItemController.addedShoppingItems
        }
    }

    // MARK: - UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingItemController.shoppingItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GroceryItem", for: indexPath) as? GroceryItemCollectionViewCell else { return UICollectionViewCell() }
        
        let shoppingItem = shoppingItemController.shoppingItems[indexPath.item]
        if shoppingItem.hasBeenAdded {
            cell.groceryAddedLabel.text = "Added"
        } else {
            cell.groceryAddedLabel.text = "Not Added"
        }
        
        cell.groceryImageView.image = UIImage(named: shoppingItem.image)
        cell.groceryNameLabel.text = shoppingItem.name
    
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        func toggleHasBeenAdded(for item: GroceryItemCollectionViewCell) {
            guard let selectedItem = collectionView.indexPathsForSelectedItems?.first?.item else { return }
            
            shoppingItemController.updateHasBeenAdded(for: shoppingItemController.shoppingItems[selectedItem])
        }
    }

}
