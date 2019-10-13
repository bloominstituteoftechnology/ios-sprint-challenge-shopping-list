//
//  ShoppingListCollectionVC.swift
//  Shopping List
//
//  Created by Joseph Rogers on 10/13/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ShoppingListCollectionVC: UICollectionViewController {
  
    var orderDetailViewController: SendOrderVC?
    let itemCell = ShoppingItemCollectionVCell()
    let shoppingController = ShoppingList()
    var numberOfItemsSelected = 0
    
    
    func selectedItemsCount() {
        numberOfItemsSelected = 0
        for item in shoppingController.items {
            if item.inShoppingList == true {
                numberOfItemsSelected += 1
            }
            continue
        }
        print(numberOfItemsSelected)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let orderDetailVC = segue.destination as? SendOrderVC else { return }
        selectedItemsCount()
        orderDetailVC.numberOfItemsSelected = numberOfItemsSelected
    }
    
    
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return shoppingController.items.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ShoppingItemCollectionVCell
        
        // Configure the cell
        let shoppingItem = shoppingController.items[indexPath.item]
        cell.item = shoppingItem
        //        shoppingController.saveToPersistentStore()
        
        
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let shoppingItem = shoppingController.items[indexPath.item]
        shoppingController.toggleListed(item: shoppingItem)
        collectionView.reloadItems(at: [indexPath])
        
        //        let shoppingItem = shoppingController.items[indexPath.item]
        //        shoppingItem.hasBeenAdded = !shoppingItem.hasBeenAdded
        
    }
}
