//
//  ShoppingCollectionViewController.swift
//  Shopping List
//
//  Created by Bradley Diroff on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ShoppingCollectionViewController: UICollectionViewController {
    
    var shoppingController = ShoppingController()
    
    private func itemFor(indexPath: IndexPath) -> ShoppingItem {
        if indexPath.section == 0 {
            print("this is section 0")
            return shoppingController.pickedItems[indexPath.row]
        } else {
            print("this is section 1")
            return shoppingController.unpickedItems[indexPath.row]
        }
    }
    
    func toggleHasBeenPicked(for item: ShoppingItem) {
        
            shoppingController.updateItem(with: item)
            collectionView?.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
        if segue.identifier == "checkout" {
            guard let vc = segue.destination as? ShoppingDetailViewController else {return}
            vc.shopList = shoppingController.pickedItems
        }
            
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("ITEMS ALL TOGETHER: \(shoppingController.shoppingItems) ITEMS UNPICKED: \(shoppingController.unpickedItems)")
                if section == 0 {
            print("THERES PICKED ITEMS HERE")
            return shoppingController.pickedItems.count
        } else {
            print("THERES ITEMS HERE")
                    print("UNPICKED ITEMS COUNT: \(shoppingController.pickedItems.count)")
            return shoppingController.unpickedItems.count
        }
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ShoppingCollectionViewCell else {return UICollectionViewCell()}
    
               print("CELL COMING UP")
         let item = itemFor(indexPath: indexPath)
         print(indexPath.section)
         print(item.name)
         cell.item = item
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = itemFor(indexPath: indexPath)
        toggleHasBeenPicked(for: item)
    }
    


}
