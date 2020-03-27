//
//  ItemsCollectionViewController.swift
//  Shopping List
//
//  Created by Cameron Collins on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ItemsCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }

    //Variables
    let shoppingItemController = ShoppingItemController()
    
    
    //Functions
    func updateView() {
        title = "Shopping Cart"
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let identifier = segue.identifier else { return }
        
        if let destination = segue.destination as? CartViewController {
            if identifier == "cartSegue" {
                destination.shoppingItemController = shoppingItemController
            }
        }
    }
    
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return shoppingItemController.shoppingItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath)
    
        guard let myCell = cell as? ItemCollectionViewCell else { return cell }
    
        myCell.shoppingItem = shoppingItemController.shoppingItems[indexPath.item]
        
        return myCell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */
    

    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {

            if shoppingItemController.shoppingItems[indexPath.item]?.inShoppingList == true {
                shoppingItemController.shoppingItems[indexPath.item]?.inShoppingList = false
            } else {
                shoppingItemController.shoppingItems[indexPath.item]?.inShoppingList = true
            }
        
            collectionView.reloadData()
         return true
    }

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
