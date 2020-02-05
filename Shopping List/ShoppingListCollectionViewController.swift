//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Nichole Davidson on 1/31/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit



class ShoppingListCollectionViewController: UICollectionViewController {

    let shoppingListController = ShoppingListController()

    override func viewDidLoad() {

    }


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return shoppingListController.items.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingListItemCell", for: indexPath) as? ListOfItemsCollectionViewCell else {fatalError()}
    
        let item = shoppingListController.items[indexPath.row]
        
        cell.shoppingItem = item
    
        return cell
    }
    

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = shoppingListController.items[indexPath.row]
        shoppingListController.updateIsAdded(shoppingItem: item)
        collectionView.reloadItems(at: [indexPath])
        
    }
    
    // MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SubmitOrderSegue" {
            guard let submitOrderVC = segue.destination as? SubmitOrderDetailViewController else { return }
            submitOrderVC.shoppingListController = shoppingListController
        }
    }
    

}
