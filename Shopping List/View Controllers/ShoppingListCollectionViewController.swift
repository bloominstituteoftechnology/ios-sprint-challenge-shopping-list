//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by patelpra on 6/1/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

// private let reuseIdentifier = "ShoppingItemCell"

class ShoppingListCollectionViewController: UICollectionViewController {
    
    var shoppingListController = ShoppingListController()

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.reloadData()

        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "ShoppingItemCell")

    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToSendOrder" {
            guard let shoppingListDetailVC = segue.destination as? ShoppingListDetailViewController else { return }
            shoppingListDetailVC.shoppingListController = self.shoppingListController
        }
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.shoppingListController.shoppingItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingItemCell", for: indexPath) as? ShoppingItemCollectionViewCell else { return UICollectionViewCell() }
        
        let shoppingItem = self.shoppingListController.shoppingItems[indexPath.row]
        cell.nameLabel.text = shoppingItem.name
        cell.imageView.image = UIImage(named: shoppingItem.name)
        cell.hasBeenAddedLabel.text = shoppingItem.hasBeenAdded ? "Added" : "Not Added"
        cell.delegate = self
    
        return cell
    }
}

    // MARK: UICollectionViewDelegate
    extension ShoppingListCollectionViewController: ShoppingItemCollectionViewCellDelegate {
        func toggleHasBeenAdded(for cell: ShoppingItemCollectionViewCell) {
            guard let indexPath = self.collectionView?.indexPath(for: cell) else { return }
            
        let shoppingItem = self.shoppingListController.shoppingItems[indexPath.row]
        self.shoppingListController.updateHasBeenAdded(for: shoppingItem)
            
            collectionView?.reloadData()
        }
    }

