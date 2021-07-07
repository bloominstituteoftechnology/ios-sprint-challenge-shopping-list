//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by LaFleur on 12/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

protocol itemDelegate: AnyObject {
    func itemTapped(shoppingItem item: ShoppingListCollectionViewCell)
}



class ShoppingListCollectionViewController: UICollectionViewController {
    // MARK: Properties
    let listController: ListController = ListController()
    
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return listController.itemNames.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as? ShoppingListCollectionViewCell else { return UICollectionViewCell() }
        
        let list = listController.itemNames[indexPath.item]
        
        cell.imageView.image = ShoppingItem.image
        cell.itemTextLabel.text = ShoppingItem.shoppingItem
        
    }
    func shouldBeAddedUpdate () {
        self.collectionView?.reloadData()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowEditShoppingListSegue" {
            if let editShoppingListVC = segue.destination as? EditShoppingListViewController {
                editShoppingListVC.delegate = self
            }
        }
    }

}
// MARK: - Extensions

extension ShoppingListCollectionViewController: itemDelegate {
    func ItemTapped(forItem item: ShoppingListCollectionViewCell) {
        guard let shoppingItem = item.shoppingItem else { return }

    }
}
