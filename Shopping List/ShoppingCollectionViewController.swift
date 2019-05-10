//
//  ShoppingCollectionViewController.swift
//  Shopping List
//
//  Created by Mitchell Budge on 5/5/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit


class ShoppingCollectionViewController: UICollectionViewController {
    var shoppingManager = ShoppingManager()
  
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        shoppingManager = ShoppingManager()
        collectionView?.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingManager.shoppingList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FoodCell", for: indexPath) as! ShoppingCell
        let shoppingItem = shoppingManager.shoppingList[indexPath.item]
        cell.shoppingItem = shoppingItem
        
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailSegue" {
            let detailVC = segue.destination as! ShoppingDetailViewController
            detailVC.shoppingMgr = self.shoppingManager
        }
    }
    
    //
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        shoppingManager.updateStatus(item: shoppingManager.shoppingList[indexPath.item])
        collectionView.reloadData()
    }
}
