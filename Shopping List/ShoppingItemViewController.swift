//
//  ShoppingItemViewController.swift
//  Shopping List
//
//  Created by Alex Perse on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

private let reuseidentifier = "ShoppingItemCell"

class ShoppingItemViewController: UICollectionViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collectionView?.reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingItemController.itemNames.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingItemCell", for: indexPath) as! ShoppingItemCollectionViewCell
        
        let shoppingItem = shoppingItemController.shoppingItems[indexPath.item]
        cell.textLabel.text = shoppingItem.name
        cell.imageView.image = shoppingItem.image
        
        return cell
        
    }
    let shoppingItemController = ShoppingItemController() 

}
