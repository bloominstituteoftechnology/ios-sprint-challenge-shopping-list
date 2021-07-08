//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Lambda_School_Loaner_167 on 8/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit



class ShoppingListCollectionViewController: UICollectionViewController {
    
    var ShoppingListItemController = ShoppingListController()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        ShoppingListItemController = ShoppingListController()
        ShoppingListItemController.loadFromPersistentStore()
        collectionView?.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return ShoppingListItemController.shoppingListItem.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingListCell", for: indexPath) as! ShoppingListItemCollectionViewCell
        let item = ShoppingListItemController.shoppingListItem[indexPath.item]
        cell.shopList = item
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "UserDetailSegue" {
            let placeOrderVC = segue.destination as! UserDetailedViewController
            placeOrderVC.shoppingItemController = self.ShoppingListItemController
        }
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath:
        IndexPath) {
        ShoppingListItemController.updateStatus(item: ShoppingListItemController.shoppingListItem[indexPath.item])
        collectionView.reloadData()
    }
}
