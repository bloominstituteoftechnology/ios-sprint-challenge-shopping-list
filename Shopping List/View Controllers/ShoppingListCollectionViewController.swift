//
//  ShoppingItemCollectionViewController.swift
//  Shopping List
//
//  Created by Breena Greek on 2/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

//protocol IsSelectedDelegate {
//    func isSelectedArray(_ shoppingItem: ShoppingItem)
//}

private let reuseIdentifier = "ShoppingItemCell"

class ShoppingListCollectionViewController: UICollectionViewController {
    
    let shoppingItemController = ShoppingItemController()
//    var delegate: IsSelectedDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: UICollectionViewDataSource


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingItemController.shoppingList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ShoppingItemCollectionViewCell else { return UICollectionViewCell() }
        
        let shoppingItem = shoppingItemController.shoppingList[indexPath.item]
        cell.shoppingItem = shoppingItem
        cell.shoppingItemController = shoppingItemController
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? ShoppingItemCollectionViewCell else { return }
        
        let shoppingItem = shoppingItemController.shoppingList[indexPath.item]
        shoppingItemController.toggleItemSelected(shoppingItem: shoppingItem)
        let updatedShoppingitem = shoppingItemController.shoppingList[indexPath.item]
        cell.shoppingItem = updatedShoppingitem
    }
}

