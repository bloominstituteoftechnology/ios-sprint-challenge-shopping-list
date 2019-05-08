//
//  ShoppingCollectionViewController.swift
//  Shopping List
//
//  Created by Mitchell Budge on 5/5/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit


class ShoppingCollectionViewController: UICollectionViewController {

    //var shoppingManager: ShoppingManager?
    var shoppingManager = ShoppingManager()
  
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        shoppingManager = ShoppingManager()
       //self.collectionView!.register(ShoppingCell.self, forCellWithReuseIdentifier: "FoodCell")   caused the initial error for casting the cell
        collectionView?.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //collectionView?.reloadData()
    }
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingManager.shoppingList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FoodCell", for: indexPath) as! ShoppingCell
        //cell.statusLabel.text = String(describing: shoppingManager.shoppingList[indexPath.row].hasBeenAdded)
        //cell.shoppingItemLabel.text = shoppingManager.shoppingList[indexPath.row].itemName
        //cell.shoppingImageView.image = shoppingManager.shoppingList[indexPath.row].itemImage
        
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
