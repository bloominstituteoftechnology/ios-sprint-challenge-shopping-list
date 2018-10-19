//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Evan Cruz on 10/19/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import UIKit


class ShoppingListCollectionViewController: UICollectionViewController {
  
  let reuseIdentifier = "cell"
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    collectionView?.reloadData()
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return shoppingItemController.shoppingItems.count
  }
  
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    let shoppingItem = shoppingItemController.shoppingItems[indexPath.item]
  
    return cell
  }
  
  var shoppingItemController = ShoppingItemController()
}
