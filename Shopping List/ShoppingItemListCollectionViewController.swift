//
//  ShoppingItemListCollectionViewController.swift
//  Shopping List
//
//  Created by Zack Larsen on 11/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemListCollectionViewController: UICollectionViewController {
    
    let shoppingListController = ShoppingListController()
    private let reuseIdentifier = "ItemCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.allowsSelection = true
        collectionView?.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
    }
    
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return shoppingListController.listItems.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ShoppingItemCollectionViewCell else { return UICollectionViewCell() }
        
        let item = shoppingListController.listItems[indexPath.row]
        cell.shopping = item
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
           let shoppingItem = shoppingListController.listItems[indexPath.row]
           
           shoppingListController.createNewOrder(shoppingItem)
           shoppingListController.addedToggle(shoppingItem)
            collectionView.reloadData()
       }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        guard let detailVC = segue.destination as? DetailViewController else { return }
        detailVC.shoppingListController = shoppingListController
    }
    
    
}

