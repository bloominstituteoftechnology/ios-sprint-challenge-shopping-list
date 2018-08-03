//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Linh Bouniol on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewController: UICollectionViewController {

    // MARK: - Properties
    
    var shoppingItemController = ShoppingItemController()
    
    // MARK: - View Lifecycles
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        collectionView?.reloadData()
    }
    
    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingItemController.shoppingItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as! ShoppingItemCollectionViewCell
    
        let shoppingItem = shoppingItemController.shoppingItems[indexPath.item]
        
        cell.nameLabel?.text = shoppingItem.name
        cell.imageview?.image = UIImage(named: shoppingItem.image)
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let index = collectionView.indexPathsForSelectedItems?.first?.item else { return }
        
        let shoppingItem = shoppingItemController.shoppingItems[index]
        
        if shoppingItem.hasBeenAdded == true {
            shoppingItemController.updateHasBeenAdded(for: shoppingItem)
        } 
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? ShoppingDetailViewController else { return }
        
        detailVC.shoppingItemController = shoppingItemController
    }
    

}
