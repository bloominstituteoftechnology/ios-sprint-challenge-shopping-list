//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Chris Dobek on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ShoppingListCollectionViewController: UICollectionViewController {
    
    var shoppingController = ShoppingController()
    
    private func itemFor(indexPath: IndexPath) -> ShoppingItem {
    if indexPath.section == 0 {
        return shoppingController.pickedItems[indexPath.row]
    } else {

        return shoppingController.unpickedItems[indexPath.row]
    }
}
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "ShowSendOrderSegue" {
            guard let vc = segue.destination as? SendOrderViewController else {return}
            vc.shopList = shoppingController.pickedItems
        }

    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
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
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ShoppingItemCollectionViewCell else {return UICollectionViewCell()}

               print("CELL COMING UP")
         let item = itemFor(indexPath: indexPath)
         print(indexPath.section)
         print(item.name)
         cell.item = item

        return cell
    }
    
    func toggleHasBeenPicked(for item: ShoppingItem) {

            shoppingController.updateItem(with: item)
            collectionView?.reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = itemFor(indexPath: indexPath)
        toggleHasBeenPicked(for: item)
    }
}
