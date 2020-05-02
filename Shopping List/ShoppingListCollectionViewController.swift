//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Josh Kocsis on 5/1/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ShoppingListCell"

class ShoppingListCollectionViewController: UICollectionViewController {
    
    let shoppingListController = ShoppingListController()

    override func viewDidLoad() {
        super.viewDidLoad()
        shoppingListController.loadFromPersistenceStore()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return shoppingListController.shoppingList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ShoppingListCollectionViewCell else { return UICollectionViewCell() }
        
        cell.shoppingItems = shoppingListController.shoppingList[indexPath.item]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = self.collectionView(collectionView, cellForItemAt: indexPath) as? ShoppingListCollectionViewCell, let item = cell.shoppingItems else { return }
        
        shoppingListController.updateShoppintList(for: item)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "ShoppingListDetailSegue":
            let detailVC = segue.destination as? ShoppingListDetailViewController
                detailVC?.itemsAdded = shoppingListController.itemsAdded
        default:
            break
        }
    }
}
