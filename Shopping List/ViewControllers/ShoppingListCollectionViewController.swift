//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Kobe McKee on 5/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ShoppingItemCell"

class ShoppingListCollectionViewController: UICollectionViewController {

    var shoppingItemController = ShoppingItemController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingItemController.items.count
    }

    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ShoppingItemCollectionViewCell else { fatalError("Unable to dequeue cell")}
        
        let item = shoppingItemController.items[indexPath.item]
        cell.itemImageView.image = UIImage(named: item.itemName)
        cell.itemNameLabel.text = item.itemName
        if item.addedToCart {
            cell.isAddedLabel.text = "Added"
        } else {
        cell.isAddedLabel.text = "Not Added"
        }
        
        return cell
    }

    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let shoppingItem = shoppingItemController.items[indexPath.item]
        shoppingItemController.switchItemInCart(item: shoppingItem)
        collectionView.reloadData()
    }
    
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CheckoutSegue" {
            let destinationVC = segue.destination as? CheckoutViewController
            destinationVC?.shoppingItemController = shoppingItemController
        }
    }
    

}
