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
    func itemTapped(shoppingItem item: ShoppingItemCollectionViewCell)
}

class ShoppingListCollectionViewController: UICollectionViewController  {

    let shoppingListController = ShoppingListController()
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shoppingListController.loadItems()
        
    }
    
   
    
    override func viewWillAppear(_ animated: Bool) {
        self.collectionView!.delegate = self
        super.viewWillAppear(animated)
        collectionView?.reloadData()
        
    }
    
 
   
   
    
  
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if segue.identifier == "OrderSegue" {
        
       guard let userDetailVC = segue.destination as? UserDetailViewController else { return }
            userDetailVC.itemsOrderedCount = shoppingListController.addedToCart.count
    }
    }
    // MARK: UICollectionViewDataSource


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return shoppingListController.shoppingItem.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as? ShoppingItemCollectionViewCell else { return UICollectionViewCell() }
        
        cell.shoppingItem = shoppingListController.shoppingItem[indexPath.item]
        cell.delegate = self 
        // Configure the cell
    
        return cell
    }
}


    // MARK: UICollectionViewDelegate

extension ShoppingListCollectionViewController: itemInitializedDelegate {
   
    func itemTapped(shoppingItem item: ShoppingItemCollectionViewCell) {
       
        guard let shoppingItem = item.shoppingItem else { return }
        
        shoppingListController.itemToggled(for: shoppingItem)
        collectionView?.reloadData()
}
}
