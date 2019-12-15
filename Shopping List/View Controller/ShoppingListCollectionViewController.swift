//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Morgan Smith on 12/13/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewController: UICollectionViewController, ShoppingListDelegate {

    let shoppingListController = ShoppingListController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.reloadData()
    }
    
    func toggleHasBeenAdded(cell: ShoppingListCollectionViewCell) {
        guard let indexPath = collectionView?.indexPath(for: cell) else { return }
        shoppingListController.updateList(for: shoppingListController.shoppingItem[indexPath.item])
        collectionView?.reloadData()
      }
      

    
    // MARK: - Navigation

    /*
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowOrder" {
            guard let orderVC = segue.destination as? OrderViewController else {return}
            
        }
    }
    */

    // MARK: UICollectionViewDataSource


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingListController.shoppingItem.count
        
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingListViewCell", for: indexPath) as? ShoppingListCollectionViewCell else {
            return UICollectionViewCell() }
        
        cell.delegate = self

        let item = shoppingListController.shoppingItem[indexPath.item]
        cell.item = item
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

}
