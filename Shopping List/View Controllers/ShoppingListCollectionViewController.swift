//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Scott Bennett on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit



class ShoppingListCollectionViewController: UICollectionViewController {
    
    let shoppingItemController = ShoppingItemController()
    var shoppingListItems = [ShoppingListItem]()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingItemController.shoppingListItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingItem", for: indexPath) as! ShoppingItemCollectionViewCell
        
        let shoppingItem = shoppingItemController.shoppingListItems[indexPath.item]
        cell.itemName.text = shoppingItem.itemName.capitalized
        cell.addToOrder.text = shoppingItem.addToList ? "Added" : "Not Added"
        cell.imageView.image = shoppingItem.image
        
        return cell
    }

    // MARK: UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let shoppingListItem = shoppingItemController.shoppingListItems[indexPath.item]
        shoppingItemController.toggleAdd(for: shoppingListItem)
        collectionView.reloadData()
    }

    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SendOrder" {
            guard let destinationVC = segue.destination as? SendOrderViewController else { return }
            destinationVC.shoppingItemController = shoppingItemController
        }
    }

}




// let indexPaths = collectionView?.indexPathsForSelectedItems,
// let indexPath = indexPaths.first
