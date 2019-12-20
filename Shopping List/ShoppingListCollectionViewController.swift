//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by user162867 on 12/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "cell"

class ShoppingListCollectionViewController: UICollectionViewController {
    
    let shoppingListController = ShoppingItemController()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.collectionView?.reloadData()
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return shoppingListController.shoppingItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ShoppingListCollectionViewCell else { return UICollectionViewCell() }
    
        let item = shoppingListController.shoppingItems[indexPath.item]
        cell.shoppingItem = item
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = self.collectionView(collectionView, cellForItemAt: indexPath) as? ShoppingListCollectionViewCell,
            let item = cell.shoppingItem else { return }
        
        shoppingListController.toggleIt(for: item)
        collectionView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            guard let addDetailVC = segue.destination as? ShoppingListDetailViewController else { return }
            addDetailVC.delegate = shoppingListController.shoppingItems
        }
    }


}
