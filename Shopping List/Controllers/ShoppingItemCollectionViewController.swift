//
//  ShoppingItemCollectionViewController.swift
//  Shopping List
//
//  Created by David Oliver Doswell on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewController: UICollectionViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    let shoppingItemController = ShoppingItemController()

    // delegate and data source methods

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return shoppingItemController.shoppingItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ShoppingItemCollectionViewCell
        
        let shoppingItem = shoppingItemController.shoppingItems[indexPath.item]
       
        cell.shoppingItemImage.image = UIImage(data: shoppingItem.itemImage)
        cell.shoppingItemLabel.text = shoppingItem.itemName
        
        return cell
    }
}
