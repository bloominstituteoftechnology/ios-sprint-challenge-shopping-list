//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Jessie Ann Griffin on 8/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewController: UICollectionViewController {

    let shoppingListController = ShoppingListController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showNameAddressSegue" {
            if let orderItemsVC = segue.destination as? OrderItemsViewController {
                orderItemsVC.shoppingListController = self.shoppingListController
            }
        }
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return shoppingListController.shoppingItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as?
            ShoppingItemCollectionViewCell else { return UICollectionViewCell() }
        
        let item = shoppingListController.shoppingItems[indexPath.item]
        cell.imageView.image = UIImage(named: item.name)
        if cell.isSelected {
            shoppingListController.updateIsAdded(item: indexPath.item)
        }
//        if item.added == false {
//            cell.textLabel.text = "Not Added"
//        } else {
//            cell.textLabel.text = "Added"
//        }
        return cell
    }
    
    
    // MARK: UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
       return true
   }
//
//    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//
//        //guard let cell = collectionView.cellForItem(at: indexPath) as? ShoppingItemCollectionViewCell else { return }
//
//        //let item = shoppingListController.shoppingItems[indexPath.item]
//
//        //if cell.isSelected {
//            shoppingListController.updateIsAdded(item: indexPath.item)
//       // } //else if !cell.isSelected {
//        //  shoppingListController.updateIsAdded(item: indexPath.item)
//        // }
//    }
//
}
