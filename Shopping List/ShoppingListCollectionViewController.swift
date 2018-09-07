//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Daniela Parra on 9/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        collectionView?.reloadData()
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "NextSegue" {
            guard let destinationVC = segue.destination as? SendOrderViewController else {return}
            
            destinationVC.shoppingItemController = shoppingItemController
        }
    }

    // MARK: UICollectionViewDataSource
    
    /*
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
    */

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingItemController.shoppingItems.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Got clicked!")
        let shoppingItem = shoppingItemController.shoppingItems[indexPath.item]
        
        shoppingItemController.update(shoppingItem: shoppingItem)
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingItemCell", for: indexPath) as! ShoppingItemCollectionViewCell
    
        let shoppingItem = shoppingItemController.shoppingItems[indexPath.item]
        cell.shoppingItem = shoppingItem
    
        return cell
    }
    
    
    
    let shoppingItemController = ShoppingItemController()

}
