//
//  ShoppingItemsCollectionViewController.swift
//  Shopping List
//
//  Created by Rick Wolter on 10/19/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit


private let reuseIdentifier = "Cell"

class ShoppingItemsCollectionViewController: UICollectionViewController {
    
    
    let notification = Notification()
    let shoppingItemController = ShoppingItemController()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CartSegue" {
            guard let destinationVC = segue.destination as? CartViewController else { return }
            destinationVC.notification = notification
            destinationVC.shoppingItemController = shoppingItemController
        }
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return  shoppingItemController.shoppingItems.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ShoppingItemCollectionViewCell else { return UICollectionViewCell() }
        let item = shoppingItemController.shoppingItems[indexPath.item]
        cell.item = item
        
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let item = shoppingItemController.shoppingItems[indexPath.item]
        
        shoppingItemController.update(item: item)
        collectionView.reloadData()
    }
    
}
