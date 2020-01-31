//
//  ShoppingListCollectionVC.swift
//  Shopping List
//
//  Created by Nick Nguyen on 1/31/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit



class ShoppingListCollectionVC: UICollectionViewController {

    var pickedItems = 10
    
    
    var shop = ShopplingListController()
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.reloadData()
       
    }

    // MARK: UICollectionViewDataSource
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shop.shoppingLists.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Helper.shopCellId, for: indexPath) as? ShopCell else { return UICollectionViewCell() }
        let item = shop.shoppingLists[indexPath.item]
        cell.shoppingItem = item
        return cell
        
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard  let cell  = collectionView.cellForItem(at: indexPath) as? ShopCell else { return }
        
        shop.toggle(for: indexPath.item)
        cell.itemStatus.text = shop.shoppingLists[indexPath.item].isAdded ? "Added" : "No Added"
        cell.itemStatus.textColor = shop.shoppingLists[indexPath.item].isAdded ? UIColor.green : UIColor.red
        
        let addedItems = shop.shoppingLists.filter {
            $0.isAdded
        }
        print(addedItems.count)
        
        pickedItems = addedItems.count
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Helper.shopSegue {
            guard let destVC = segue.destination as? DetailVC else { return }
            destVC.totalItem = pickedItems
        }
    }
}
