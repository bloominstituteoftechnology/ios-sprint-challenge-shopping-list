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
        if item.added == false {
            cell.textLabel.text = "Not Added"
        } else {
            cell.textLabel.text = "Added"
        }
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let cell = collectionView.cellForItem(at: indexPath) as? ShoppingItemCollectionViewCell else { return }
        
        //let item = shoppingListController.shoppingItems[indexPath.item]
        
        if cell.isSelected {
            shoppingListController.updateIsAdded(item: indexPath.item)
        //    cell.textLabel.text = "Added"
        } //else {
//            shoppingListController.updateIsAdded(item: indexPath.item)
//            cell.textLabel.text = "Not Added"
//        }
        
       // return cell
    }

    func updateViews(item: ShoppingItem) {
        if item.added == false {
            cell.textLabel.text = "Not Added"
        } else {
            cell.textLabel.text = "Added"
        }
    }
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    // Uncomment this method to specify if the specified item should be selected
//    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
//        return true
//    }

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
