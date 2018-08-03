//
//  ShoppingCollectionViewController.swift
//  Shopping List
//
//  Created by Conner on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ShoppingCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingController.shoppingItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingItemCell", for: indexPath) as! ShoppingCollectionViewCell
        
        cell.shoppingItemLabel.text = shoppingController.shoppingItems[indexPath.item].name
        cell.shoppingItemImageView.image = shoppingController.shoppingItems[indexPath.item].image
        
    
        return cell
    }
    
    var shoppingController: ShoppingController = ShoppingController()
}
