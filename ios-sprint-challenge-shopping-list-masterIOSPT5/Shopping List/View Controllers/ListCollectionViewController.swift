//
//  ListCollectionViewController.swift
//  Shopping List
//
//  Created by David Williams on 2/23/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit


var numberOfItems = 0

class ListCollectionViewController: UICollectionViewController {
    
 
    let shoppingController = ShoppingController()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .lightGray
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return shoppingController.items.count
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SubmitOrderSegue" {
            guard let submitOrderVC = segue.destination as? ShoppingListViewController else { return }
            submitOrderVC.shoppingController = shoppingController
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListCell", for: indexPath) as? ListCollectionViewCell else { return UICollectionViewCell()}
    
        let item = shoppingController.items[indexPath.item]
        cell.item = item
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let shoppingItem = shoppingController.items[indexPath.item]
        if shoppingItem.added {
            numberOfItems -= 1
            shoppingController.removeItem(shoppingItem.name)
        } else {
            numberOfItems += 1
            shoppingController.orderedItems(shoppingItem.name)
        }
        shoppingController.updateAddedBool(shoppingItem: shoppingItem)
        shoppingController.saveToPersistentStore()
        collectionView.reloadItems(at: [indexPath])
    }
}
