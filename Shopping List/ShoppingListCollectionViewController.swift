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
    
    var shoppingListController = ShoppingListController()


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingListController.shoppingList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ShoppingListCollectionViewCell else { return UICollectionViewCell() }
        
        cell.shoppingItems = shoppingListController.shoppingList[indexPath.item]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = shoppingListController.shoppingList[indexPath.item]
        shoppingListController.updateShoppingList(for: item)
        collectionView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "ShoppingListDetailSegue":
            let detailVC = segue.destination as? ShoppingListDetailViewController
            detailVC?.shoppingListController = shoppingListController
        default:
            break
        }
    }
}
