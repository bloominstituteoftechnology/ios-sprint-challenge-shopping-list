//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Chad Rutherford on 11/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewController: UICollectionViewController {
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Properties
    let shoppingItemController = ShoppingItemController()
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case Segues.showDetailSegue:
            guard let shoppingDetailVC = segue.destination as? ShoppingListDetailViewController else { return }
            shoppingDetailVC.shoppingController = shoppingItemController
        default:
            break
        }
    }
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Collection View Delegate/DataSource Methods
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return shoppingItemController.addedItems.count
        case 1:
            return shoppingItemController.notAddedItems.count
        default:
            return 0
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cells.itemCell, for: indexPath) as? ShoppingItemCell else { return UICollectionViewCell() }
        switch indexPath.section {
        case 0:
            let item = shoppingItemController.addedItems[indexPath.item]
            cell.item = item
            return cell
        case 1:
            let item = shoppingItemController.notAddedItems[indexPath.item]
            cell.item = item
            return cell
        default:
            return UICollectionViewCell()
        }
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            let item = shoppingItemController.addedItems[indexPath.item]
            shoppingItemController.toggleAdded(for: item)
        case 1:
            let item = shoppingItemController.notAddedItems[indexPath.item]
            shoppingItemController.toggleAdded(for: item)
        default:
            break
        }
        collectionView.reloadData()
    }
}
