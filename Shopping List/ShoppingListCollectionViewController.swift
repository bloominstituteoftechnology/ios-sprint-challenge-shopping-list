//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Craig Belinfante on 6/14/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ShoppingListCollectionViewController: UICollectionViewController {
    
    var shoppingListController = ShoppingListController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
       // shoppingList.updateViews()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Register cell classes
       // self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        // Do any additional setup after loading the view.
    }
    
 
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        
        return shoppingListController.shoppingList.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Shopping Items", for: indexPath) as? ShoppingListCollectionViewCell else { return UICollectionViewCell() }
        
        
        // Configure the cell
        let item = shoppingListController.shoppingList[indexPath.item]
        cell.itemInCart = item
    
        return cell
        
    }
    // MARK: UICollectionViewDelegate
        
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        shoppingListController.toggleItemAdded(indexPath: indexPath)
        collectionView.reloadData()
        
       // shoppingList.saveToPersistentStore()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailedCart = segue.destination as? CartViewController else { return }
        detailedCart.shoppingListController = shoppingListController
    }
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
    
}

