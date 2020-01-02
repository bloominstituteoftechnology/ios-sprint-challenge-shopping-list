//
//  ShoppingItemsCollectionViewController.swift
//  Shopping List
//
//  Created by Gerardo Hernandez on 12/30/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

//private let reuseIdentifier = "ItemCell"

protocol itemInitializedDelegate: AnyObject {
    func itemTapped(_ item: ItemCollectionViewCell)
}

class ShoppingItemsCollectionViewController: UICollectionViewController {

    let shoppingListController = ShoppingListController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shoppingListController.loadFromPersistentStore()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
    }
        
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if segue.identifier == "OrderSegue"{
        
       guard let userDetailVC = segue.destination as? UserDetailViewController else { return }
        userDetailVC.itemsOrderedCount = shoppingListController.addedToCart.count
    }
    }
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return shoppingListController.shoppingList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as? ItemCollectionViewCell else { return UICollectionViewCell() }
        
        cell.delegate = self
        cell.itemName = shoppingListController.addedToCart[indexPath.item]
        cell.itemName = shoppingListController.notAddedtoCart[indexPath.item]
    
        // Configure the cell
    
        return cell
    }
    }


    // MARK: UICollectionViewDelegate

extension ShoppingItemsCollectionViewController: itemInitializedDelegate {
   
    func itemTapped(_ item: ItemCollectionViewCell) {
        guard let itemName = item.itemName else { return }
        
        shoppingListController.itemToggled(for: itemName)
        collectionView?.reloadData()
}


}
