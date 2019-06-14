//
//  ViewController.swift
//  Shopping List
//
//  Created by Spencer Curtis on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemsCollectionViewController: UICollectionViewController {
    
    let shoppingItemsController = ShoppingItemController

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ShoppingItemController.shoppingItems.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingItemCell", for: <#T##IndexPath#>) as! ShoppingItemsCollectionViewController
        
        let shoppingItem = shoppingItemController.shoppingItems[indexPath.item]
        cell.imageView.image = shoppingItem.image
        cell.textLabel.text = shoppingItem.name
        
        return cell
    }
    
    @IBAction func unwindToShoppingItemsCollectionViewController(_ sender: UIStoryboardSegue) {
    }
   
}
    




