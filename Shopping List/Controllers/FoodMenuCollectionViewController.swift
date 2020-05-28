//
//  FoodMenuCollectionViewController.swift
//  Shopping List
//
//  Created by Bryan Cress on 5/22/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit


class FoodMenuCollectionViewController: UICollectionViewController {

    let shoppingItemController = ShoppingItemController()
    

    // MARK: - Navigation
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "CheckoutSegue" {
                guard let destination = segue.destination as? OrderSubmitterViewController else { return }
                    destination.shoppingList = shoppingItemController
                }
            }

    // MARK: - UICollectionViewDataSource
        
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingItemController.shoppingItems.count
    }
        
        
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingItemCell", for: indexPath) as? ShoppingItemCollectionViewCell else { return UICollectionViewCell() }
        let item = shoppingItemController.shoppingItems[indexPath.item]
        cell.shoppingItem = item
        return cell
    }

// MARK: - UICollectionViewDelegate
        
        override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            var item = shoppingItemController.shoppingItems[indexPath.item]
            item.addedToCart.toggle()
            shoppingItemController.shoppingItems[indexPath.item] = item
            shoppingItemController.saveToPersistentStore()
            collectionView.reloadData()
        }
    }






        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes


        // Do any additional setup after loading the view.
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource



//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingItemCell", for: indexPath) as? ShoppingItemCollectionViewCell else { return } UICollectionViewCell() {
            
        
    
        // Configure the cell


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

    


