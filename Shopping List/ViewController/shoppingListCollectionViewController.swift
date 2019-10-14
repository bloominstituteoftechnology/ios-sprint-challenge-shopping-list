//
//  shoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by denis cedeno on 10/12/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ItemCell"

class shoppingListCollectionViewController: UICollectionViewController {

    let shoppingList = ShoppingItemController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
//        collectionView?.reloadData()

    }


    // MARK: UICollectionViewDataSource

//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        1
//    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        shoppingList.shoppingLists.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? shoppingListCollectionViewCell else { return UICollectionViewCell() }
    
        // Configure the cell
//        cell.imageView.image = UIImage(named: "Apple")
//        cell.imageTitle.text = "Apple"
        let listItem = shoppingList.shoppingLists[indexPath.row]
        cell.shoppingItem = listItem
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        var item = shoppingList.shoppingLists[indexPath.item]
        item.addedItem.toggle()
        shoppingList.shoppingLists[indexPath.item] = item
        shoppingList.saveToPersistentStore()
        collectionView.reloadData()
        return true
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sendPurchaseSegue"{
            guard let purchaseVC = segue.destination as? sendPurchaseViewController else { return }
            purchaseVC.shoppingListContorller = shoppingList
        }
    }


}
