//
//  ShoppingItemCollectionViewController.swift
//  Shopping List
//
//  Created by Isaac Lyons on 9/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ShoppingItemCell"

class ShoppingItemCollectionViewController: UICollectionViewController {
    
    let shoppingItemController = ShoppingItemController()

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "OrderShowSegue" {
            guard let OrderVC = segue.destination as? OrderViewController else { return }
            let orderedItems = shoppingItemController.shoppingItems.filter {$0.onList}
            OrderVC.count = orderedItems.count
        }
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let number: Int
        if section == 0 {
            number = shoppingItemController.shoppingItemsOnList.count
        } else {
            number = shoppingItemController.shoppingItemsNotOnList.count
        }
        
        return number
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ShoppingItemCollectionViewCell else {
            return UICollectionViewCell()
        }
    
        let shoppingItem: ShoppingItem
        if indexPath.section == 0 {
            shoppingItem = shoppingItemController.shoppingItemsOnList[indexPath.item]
        } else {
            shoppingItem = shoppingItemController.shoppingItemsNotOnList[indexPath.item]
        }
        
        cell.shoppingItem = shoppingItem
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let shoppingItem: ShoppingItem
        if indexPath.section == 0 {
            shoppingItem = shoppingItemController.shoppingItemsOnList[indexPath.item]
        } else {
            shoppingItem = shoppingItemController.shoppingItemsNotOnList[indexPath.item]
        }
        
        if let index = shoppingItemController.shoppingItems.firstIndex(of: shoppingItem) {
            shoppingItemController.shoppingItems[index].onList.toggle()
            shoppingItemController.saveToPersistentStore()
        }
        
        collectionView.reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeader", for: indexPath) as? SectionHeader else {
            return UICollectionReusableView()
        }
        let text: String
        if indexPath.section == 0 {
            text = "Items in list"
        } else {
            text = "Available items"
        }
        
        sectionHeader.sectionHeaderLabel.text = text
        return sectionHeader
    }

}
