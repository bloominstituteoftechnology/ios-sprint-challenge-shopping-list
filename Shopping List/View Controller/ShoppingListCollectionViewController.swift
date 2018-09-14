//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Iyin Raphael on 8/10/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit



class ShoppingListCollectionViewController: UICollectionViewController {
    

    
    let shoppingItemController = ShoppingItemController()

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }


    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return shoppingItemController.addedItem.count
        } else {
            return shoppingItemController.notAddedItem.count
        }
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as? ShoppingListCollectionViewCell else {return UICollectionViewCell()}
        cell.shoppingItem = itemAt(indexPath: indexPath)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {let item = itemAt(indexPath: indexPath)
        shoppingItemController.updateIsAdded(item: item)
        collectionView.reloadData()
    }
    
    func itemAt(indexPath:IndexPath) -> Item{
        if indexPath.section == 0 {
            return shoppingItemController.addedItem[indexPath.row]
        } else {
            return shoppingItemController.notAddedItem[indexPath.row]
        }
        
    }
}
