//
//  ShoppingItemCollectionViewController.swift
//  Shopping List
//
//  Created by Samantha Gatt on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ShoppingItemCollectionViewController: UICollectionViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    

    // MARK: UICollectionViewDataSource

    // If I have time
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return settingsHelper.shoppingItemController.shoppingItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingItemCell", for: indexPath) as! ShoppingItemCollectionViewCell
    
        
        cell.shoppingItem = settingsHelper.shoppingItemController.shoppingItems[indexPath.item]
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let item = settingsHelper.shoppingItemController.shoppingItems[indexPath.item]
        settingsHelper.shoppingItemController.updateIsAdded(item: item)
        collectionView.reloadData()
    }
    
    
    // MARK: - Func
    
    
    

    // MARK: - Properties
    
    var settingsHelper = SettingsHelper()
    
    
     // MARK: - Navigation
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetails" {
            let destVC = segue.destination as! ShoppingListDetailViewController
            let isAddedArray = settingsHelper.shoppingItemController.shoppingItems.filter {$0.isAdded}
            let number = isAddedArray.count
            destVC.numberInCart = number
        }
     }

}
