//
//  ShoppingItemCollectionViewController.swift
//  Shopping List
//
//  Created by morse on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewController: UICollectionViewController, ShoppingItemCollectionViewCellDelegate {

    let shoppingItemController = ShoppingItemController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailSegue" {
            guard let detailVC = segue.destination as? ShoppingItemDetailViewController else { return }
            detailVC.shoppingItemController = shoppingItemController
        }
    }
 
    // MARK: UICollectionViewDataSource
    
    func toggleHasBeenAdded(for cell: ShoppingItemCollectionViewCell) {
        guard let indexPath = collectionView.indexPath(for: cell) else { return }
        shoppingItemController.updateHasBeenSelected(shoppingItem: shoppingItemController.shoppingItems[indexPath.item])
        collectionView.reloadData()
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingItemController.shoppingItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as! ShoppingItemCollectionViewCell
    
        let shoppingItem = shoppingItemController.shoppingItems[indexPath.item]
        itemCell.shoppingItem = shoppingItem
        itemCell.delegate = self
        return itemCell
    }
}
