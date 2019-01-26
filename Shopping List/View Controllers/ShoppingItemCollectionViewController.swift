//
//  ShoppingItemCollectionViewController.swift
//  Shopping List
//
//  Created by Stuart on 1/25/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewController: UICollectionViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
    }

    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "NextBarButtonSegue" {
            guard let destionationVC = segue.destination as? SendOrderViewController else { return }
            destionationVC.shoppingItemController = shoppingItemController
        }
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingItemController.shoppingItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingItemCell", for: indexPath)
    
        guard let shoppingItemCell = cell as? ShoppingItemCollectionViewCell else { return cell }
              let shoppingItem = shoppingItemController.shoppingItems[indexPath.item]
    
        shoppingItemCell.imageView.image = shoppingItem.image
        shoppingItemCell.itemLabel.text = shoppingItem.name
        
        if shoppingItem.hasBeenAdded {
            shoppingItemCell.hasBeenAddedLabel.text = "✅"
        } else {
            shoppingItemCell.hasBeenAddedLabel.text = "❌"
        }
        
        return shoppingItemCell
    }

    // MARK: UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let shoppingItem = shoppingItemController.shoppingItems[indexPath.item]
        shoppingItemController.changeStatus(for: shoppingItem)
        collectionView.reloadItems(at: [indexPath])
    }
    
    let shoppingItemController = ShoppingItemController()
}
