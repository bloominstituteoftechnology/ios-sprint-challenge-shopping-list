//
//  ShoppingItemCollectionViewController.swift
//  Shopping List
//
//  Created by ronald huston jr on 4/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewController: UICollectionViewController {

    var shoppingItemController = ShoppingItemController()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowOrder" {
            
            guard let sendOrder = segue.destination as? CheckoutViewController else { return }
            
            let shoppingItemsCount = shoppingItemController.items.filter({$0.isAdded}).count

            sendOrder.itemsCount = shoppingItemsCount
        }
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return shoppingItemController.items.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as? ShoppingItemCollectionViewCell else { return UICollectionViewCell() }
    
        let item = shoppingItemController.items[indexPath.item]
        cell.item = item
        cell.isUserInteractionEnabled = true
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var selectedItem = shoppingItemController.items[indexPath.item]
        selectedItem.isAdded.toggle()
        shoppingItemController.items[indexPath.item] = selectedItem
        shoppingItemController.saveToPersistentStore()
        collectionView.reloadData()
    }
}
