//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by David Wright on 12/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ShoppingItemCell"

class ShoppingListCollectionViewController: UICollectionViewController {

    // MARK: Properties
    
    let shoppingListController = ShoppingListConroller()
    
    // MARK: Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shoppingListController.loadFromPersistentStore()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showNextDetail",
            let shoppingListDetailVC = segue.destination as? ShoppingListDetailViewController {
            shoppingListDetailVC.shoppingCart = shoppingListController.shoppingCart
        }
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return shoppingListController.shoppingList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ShoppingListCollectionViewCell else { return UICollectionViewCell() }
        
        cell.shoppingItem = shoppingListController.shoppingList[indexPath.item]
        
        return cell
    }

    // MARK: UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = self.collectionView(collectionView, cellForItemAt: indexPath) as? ShoppingListCollectionViewCell,
            let item = cell.shoppingItem else { return }
        
        shoppingListController.updateIsOnShoppingList(for: item)
        collectionView.reloadData()
    }

}
