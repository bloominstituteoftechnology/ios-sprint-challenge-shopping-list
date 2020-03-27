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
    
    // MARK: UICollectionViewDataSource
    
    private let itemsNotOnListSection = 0
    private let itemsOnListSection = 1
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == itemsNotOnListSection {
            return shoppingList.itemsNotOnList.count
        } else {
            return shoppingList.itemsOnList.count
        }
    }
    
    func itemFor(indexPath: IndexPath) -> ShoppingItem {
        let item: ShoppingItem
        
        if indexPath.section == itemsNotOnListSection {
            item = shoppingList.itemsNotOnList[indexPath.item]
        } else {
            item = shoppingList.itemsOnList[indexPath.item]
        }
        
        return item
    }
    
    func indexPathFor(item: ShoppingItem) -> IndexPath? {
        if let itemIndex = shoppingList.itemsNotOnList.firstIndex(of: item) {
            return IndexPath(item: itemIndex, section: itemsNotOnListSection)
        } else if let itemIndex = shoppingList.itemsOnList.firstIndex(of: item) {
            return IndexPath(item: itemIndex, section: itemsOnListSection)
        }
        return nil
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
        
        let newItem = shoppingList.toggleItemOnShoppingList(item)
        
        if let newIndexPath = indexPathFor(item: newItem) {
            collectionView.moveItem(at: indexPath, to: newIndexPath)
            collectionView.reloadItems(at: [newIndexPath])
        } else {
            collectionView.reloadData()
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeader", for: indexPath) as? ShoppingListSectionHeaderView else {
            fatalError("Unable to dequeue view of type \(ShoppingListSectionHeaderView.self)")
        }
        
        sectionHeader.title = indexPath.section == itemsOnListSection ? "Items on Shopping List" : "Items Not on Shopping List"
        
        return sectionHeader
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let submitOrderVC = segue.destination as? SubmitOrderViewController {
            submitOrderVC.shoppingList = shoppingList
        }
    }

}
