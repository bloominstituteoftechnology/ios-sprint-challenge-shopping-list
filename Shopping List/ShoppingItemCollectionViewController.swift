//
//  ShoppingItemCollectionCollectionViewController.swift
//  Shopping List
//
//  Created by Thomas Cacciatore on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ShoppingItemCell"

class ShoppingItemCollectionViewController: UICollectionViewController {

//    let shoppingItemController = ShoppingItemController()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }



    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return shoppingItemController.shoppingList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ShoppingItemCollectionViewCell
    
        let cellImage = shoppingItemController.shoppingList[indexPath.item]
        cell.shoppingItem = cellImage
    
        return cell
    }

    let shoppingItemController = ShoppingItemController()

}
