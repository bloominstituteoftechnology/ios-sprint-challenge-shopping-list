//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Chris Gonzales on 1/31/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewController: UICollectionViewController {
    
    // MARK - Properties
    
    let shoppingListController = ShoppingListController()
    var shoppingList = [ShoppingItem]()
    let shoppoingListViewCell = ShoppingListCollectionViewCell()
    
    // MARK - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.dataSource = self
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PlaceOrderSegua"{
            if let placeOrderVC = segue.destination as? PlaceOrderViewController{
                let passedList = shoppingList
                placeOrderVC.shoppingList = passedList
            }
        }
        
    }
    
    
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingListController.shoppingItems.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingItemViewCell", for: indexPath) as? ShoppingListCollectionViewCell else { return UICollectionViewCell()}
        let shoppingItem = shoppingListController.shoppingItems[indexPath.row]
        cell.shoppingItem = shoppingItem
        
        
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = shoppingListController.shoppingItems[indexPath.item]
        shoppingListController.update(item: item)
        collectionView.reloadData()
        
    }
}
