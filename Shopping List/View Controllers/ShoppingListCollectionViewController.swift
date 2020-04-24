//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Nonye on 4/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ShoppingCell"

class ShoppingListCollectionViewController: UICollectionViewController {

    
    let shoppingController = ShoppingController()
    var shoppingList: ShoppingList?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetailSegue" {
            guard let destinationVC = segue.destination as? ShoppingDetailViewController else { return }
            destinationVC.shoppingController = shoppingController
        }
    }
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
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
        shoppingController.saveToPersistentStore()
        collectionView.reloadData()
    }

}
