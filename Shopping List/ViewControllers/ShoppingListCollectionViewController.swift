//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Shawn Gee on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit


class ShoppingListCollectionViewController: UICollectionViewController {

    let shoppingList = ShoppingList()
    
    //MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: UICollectionViewDataSource
    
    private let itemNotOnListSection = 0
    private let itemsOnListSection = 1
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == itemNotOnListSection {
            return shoppingList.shoppingItemsNotOnList.count
        } else {
            return shoppingList.shoppingItemsOnList.count
        }
    }
    
    func itemFor(indexPath: IndexPath) -> ShoppingItem {
        let item: ShoppingItem
        
        if indexPath.section == itemNotOnListSection {
            item = shoppingList.shoppingItemsNotOnList[indexPath.item]
        } else {
            item = shoppingList.shoppingItemsOnList[indexPath.item]
        }
        
        return item
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingItemCell", for: indexPath) as? ShoppingItemCollectionViewCell else {
            fatalError("Unable to dequeue cell of type \(ShoppingItemCollectionViewCell.self)")
        }
        
        cell.item = itemFor(indexPath: indexPath)
    
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = itemFor(indexPath: indexPath)
        
        shoppingList.toggleItemOnShoppingList(item)
        collectionView.reloadData()
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let submitOrderVC = segue.destination as? SubmitOrderViewController {
            submitOrderVC.shoppingList = shoppingList
        }
    }

}
