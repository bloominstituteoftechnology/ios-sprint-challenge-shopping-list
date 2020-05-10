//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Ciara Beitel on 9/13/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewController: UICollectionViewController {

    let itemController = ShoppingItemController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemController.shoppingList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "shoppingItemCell", for: indexPath) as? ItemCollectionViewCell else { return UICollectionViewCell() }
        
        let item = itemController.shoppingList[indexPath.item]
        cell.item = item
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetailViewController" {
            guard let orderVC = segue.destination as? DetailViewController else { return }
            orderVC.itemController = itemController
        }
    }

    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        var item = itemController.shoppingList[indexPath.item]
        item.addedToList.toggle()
        itemController.shoppingList[indexPath.item] = item
        itemController.saveToPersistentStore()
        collectionView.reloadData()
        return true
    }
}
