//
//  ShoppingItemsCollectionViewController.swift
//  Shopping List
//
//  Created by Jeffrey Carpenter on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ShoppingItemCell"

class ShoppingItemsCollectionViewController: UICollectionViewController {
    
    let shoppingItemController = ShoppingItemController()

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        collectionView.reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        shoppingItemController.update(shoppingItem: shoppingItemController.shoppingItems[indexPath.item])
        collectionView.reloadItems(at: [indexPath])
    }
    
    // MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "FinishOrder" {
            guard let destinationVC = segue.destination as? ShoppingCartViewController else { return }
            destinationVC.shoppingItemController = shoppingItemController
        }
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingItemController.shoppingItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        guard let shoppingItemCell = cell as? ShoppingItemCollectionViewCell else {
            print("Error casting cell to type ShoppingItemCollectionViewCell")
            return cell
        }
        
        shoppingItemCell.shoppingItem = shoppingItemController.shoppingItems[indexPath.item]
    
        return cell
    }
}
