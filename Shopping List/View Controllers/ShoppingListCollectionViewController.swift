//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Michael on 12/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ShoppingListCell"

class ShoppingListCollectionViewController: UICollectionViewController {

    
    let shoppingListController = ShoppingListController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    
    // MARK: - Navigation

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = collectionView?.indexPathsForSelectedItems?.first?.item, let shopListDetailVC = segue.destination as? ShoppingListDetailViewController else { return }
        
        let shoppingListOrder = shoppingListController.shoppingList[indexPath]
        shopListDetailVC.shoppingList = shoppingListOrder
    }
    

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return shoppingListController.shoppingList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ShoppingListCollectionViewCell else { return UICollectionViewCell()}
    
        let shoppingList = shoppingListController.shoppingList[indexPath.item]
        cell.shoppingList = shoppingList
        
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

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
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = shoppingListController.shoppingList[indexPath.item]
        
        if item.itemAdded {
            shoppingListController.itemAdded(item: item)
        }
        print(shoppingListController.shoppingList[indexPath.item].itemAdded)
        collectionView.reloadData()
    }
}

extension ShoppingListCollectionViewController: ShoppingListViewCellDelegate {
    func toggleAddItem(cell: ShoppingListCollectionViewCell) {
        guard let indexPath = self.collectionView?.indexPath(for: cell) else { return }
        let itemIndexPath = shoppingListController.shoppingList[indexPath.item]
        
        shoppingListController.itemAdded(item: itemIndexPath)
        collectionView?.reloadData()
    }
}
