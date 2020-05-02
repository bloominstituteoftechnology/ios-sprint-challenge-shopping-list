//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Rob Vance on 5/1/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewController: UICollectionViewController {
    
    let shoppingController = ShoppingController()
    var shoppingList: ShoppingList?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetailSegue" {
            if let destinationVC = segue.destination as? ShoppingDetailViewController {
                destinationVC.shoppingController = shoppingController
            }
        }
    }
    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return shoppingController.shoppingList.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingCell", for: indexPath) as? ShoppingListCollectionViewCell else { return UICollectionViewCell() }
        
        let shoppingList = shoppingController.shoppingList[indexPath.item]
        cell.shoppingList = shoppingList
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var item = shoppingController.shoppingList[indexPath.item]
        item.addedItem.toggle()
        shoppingController.shoppingList[indexPath.item] = item
        shoppingController.saveToPresistentStore()
        collectionView.reloadData()
    }

}
