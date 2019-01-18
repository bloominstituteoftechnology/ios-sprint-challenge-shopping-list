//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Nelson Gonzalez on 1/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ShoppingListCollectionViewController: UICollectionViewController {
    
    let shoppingController = ShoppingController()
    let localNotificationHelper = LocalNotificationHelper()

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    
    // MARK: - Navigation

   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        if segue.identifier == "toOtherVC" {
            let vc = segue.destination as? OrderViewController

            vc?.shoppingController = shoppingController
            vc?.localNotificationHelper = localNotificationHelper
        }
    }
   

   

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return shoppingController.shoppingItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "shoppingCell", for: indexPath) as! ShoppingListCollectionViewCell
    
        let items = shoppingController.shoppingItems[indexPath.item]
        cell.shopping = items
        cell.delegate = self
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
    
    private func shoppingItemFor(indexPath: IndexPath) -> Shopping {
        
            return shoppingController.shoppingItems[indexPath.item]
    }

}

extension ShoppingListCollectionViewController: ShoppingCellDelegate {
    func toggleHasBeenAdded(for cell: ShoppingListCollectionViewCell) {
        guard let indexPath = collectionView?.indexPath(for: cell) else {return}
        
        let item = shoppingItemFor(indexPath: indexPath)
        shoppingController.toggleIsAdded(shoppingItem: item)
        
        collectionView?.reloadData()
        
    }
    
    
}
