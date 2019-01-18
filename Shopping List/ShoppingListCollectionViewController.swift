//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Stuart on 1/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ShoppingItemCell"

class ShoppingListCollectionViewController: UICollectionViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: - Navigation methods

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToNextScreen" {
            guard let destinationVC = segue.destination as? NameScreenViewController else { return }
            
        }
    }
    
    // MARK:- UICollectionViewDataSource methods
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int { return 2 }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 { return shoppingItemController.addedItems.count
        } else if section == 1 { return shoppingItemController.notAddedItems.count
        } else { return 0 }}
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ShoppingItemCollectionViewCell else { return UICollectionViewCell() }
        
        cell.item = indexPath.section == 0 ? shoppingItemController.addedItems[indexPath.item] : shoppingItemController.notAddedItems[indexPath.item]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let item = indexPath.section == 0 ? shoppingItemController.addedItems[indexPath.item] : shoppingItemController.notAddedItems[indexPath.item]
        shoppingItemController.update(item: item, isInShoppingList: !item.isInShoppingList)
    }
    
    let shoppingItemController = ShoppingItemController()

}

