//
//  ItemListViewController.swift
//  Shopping List
//
//  Created by Casualty on 8/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ItemListViewController: UICollectionViewController {
    
    let shoppingList = ShoppingList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PlaceOrderSegue" {
            if let itemVC = segue.destination as? OrderViewController {
                itemVC.items = shoppingList.availableItems
            }
        }
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return shoppingList.unavailableItems.count
        } else if section == 1 {
            return shoppingList.availableItems.count
        } else {
            return 0
        }
    }
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        var item: ShoppingItem
        if indexPath.section == 0 {
            item = shoppingList.unavailableItems[indexPath.item]
        } else {
            item = shoppingList.availableItems[indexPath.item]
        }
        shoppingList.moveItem(item: item)
        collectionView.reloadData()
        
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as? ShoppingItemCollectionViewCell else { return UICollectionViewCell() }
        if indexPath.section == 0 {
            cell.item = shoppingList.unavailableItems[indexPath.item]
        } else {
            cell.item = shoppingList.availableItems[indexPath.item]
        }
        return cell
    }
    
    
    
}
