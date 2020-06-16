//
//  ShoppingItemsCollectionViewController.swift
//  Shopping List
//
//  Created by John McCants on 6/12/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemsCollectionViewController: UICollectionViewController {
    
    //MARK: - Variables
    
    var shoppingController = ShoppingController()

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Detail" {
            guard let destinationVC = segue.destination as? ShoppingItemsDetailViewController else {return}
            destinationVC.shoppingController = shoppingController
            
        }
    }
    

    // MARK: UICollectionViewDataSource


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return shoppingController.shoppingItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? ShoppingItemCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        
        cell.shoppingItem = shoppingController.shoppingItems[indexPath.item]
        
        return cell
    }

    // MARK: UICollectionViewDelegate didSelect Function
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if shoppingController.shoppingItems[indexPath.item].hasBeenAdded == false {
            shoppingController.shoppingItems[indexPath.item].hasBeenAdded = true
            shoppingController.saveToPersistenceStore()
            collectionView.reloadData()
        } else if shoppingController.shoppingItems[indexPath.item].hasBeenAdded == true {
        shoppingController.shoppingItems[indexPath.item].hasBeenAdded = false
            shoppingController.saveToPersistenceStore()
            collectionView.reloadData()
        }
       
    }

}
