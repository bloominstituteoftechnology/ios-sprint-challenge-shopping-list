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
        shoppingItemController.loadFromPersistentStore()
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
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return shoppingItemController.addedShoppingItems.count
        } else {
            return shoppingItemController.notAddedShoppingItems.count
        }
        
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GroceryItem", for: indexPath) as? GroceryItemCollectionViewCell else { return UICollectionViewCell() }
        
        cell.delegate = self
        cell.shoppingItem = shoppingItemFor(indexPath: indexPath)
    
        return cell
    }
    
    func shoppingItemFor(indexPath: IndexPath) -> ShoppingItem {
        if indexPath.section == 0 {
            return shoppingItemController.addedShoppingItems[indexPath.item]
        } else {
            return shoppingItemController.notAddedShoppingItems[indexPath.item]
        }
    }
    
    // MARK: - UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let selectedItem = collectionView.indexPathsForSelectedItems?.first?.item else { return }
        if indexPath.section == 0 {
             shoppingItemController.updateHasBeenAdded(for: shoppingItemController.addedShoppingItems[selectedItem])
        } else {
             shoppingItemController.updateHasBeenAdded(for: shoppingItemController.notAddedShoppingItems[selectedItem])
        }
        collectionView.reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeader", for: indexPath) as? HeaderCollectionReusableView {
            if indexPath.section == 0 {
                sectionHeader.sectionHeaderLabel.text = "Added"
            } else {
                sectionHeader.sectionHeaderLabel.text = "Not Added"
            }
            
            return sectionHeader
        }
        return UICollectionReusableView()
    }

}

extension GroceryListCollectionViewController: ShoppingItemCollectionViewCellDelegate {
    func toggleHasBeenAdded(for cell: GroceryItemCollectionViewCell) {
        guard let indexPath = collectionView?.indexPathsForSelectedItems?.first else { return }
        
        let shoppingItem = shoppingItemFor(indexPath: indexPath)
        shoppingItemController.updateHasBeenAdded(for: shoppingItem)
        
        collectionView?.reloadData()
    }
}
