//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Percy Ngan on 8/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ShoppingItemCell"

class ShoppingListCollectionViewController: UICollectionViewController {


	// MARK: - PROPERTIES

	let shoppingItemController = ShoppingItemController()
	var numberOfItemsSelected = 0


	func selectedItemsCount() {
		numberOfItemsSelected = 0
		for item in shoppingItemController.items{
			if item.hasBeenAdded == true {
				numberOfItemsSelected += 1
			}
			continue
		}
		print(numberOfItemsSelected)
	}


	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)

		collectionView?.reloadData()
	}



    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		guard let orderDetailVC = segue.destination as? OrderDetailViewController else { return }
		selectedItemsCount()
		orderDetailVC.numberOfItemsSelected = numberOfItemsSelected
    }



	// MARK: - UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingItemController.items.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ShoppingItemCollectionViewCell
    
        // Configure the cell
    		let shoppingItem = shoppingItemController.items[indexPath.item]
			cell.shoppingItem = shoppingItem
			cell.imageView.image = shoppingItem.image
			cell.itemNameLabel.text = shoppingItem.itemName

		shoppingItemController.saveToPersistentStore()
		
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let shoppingItem = shoppingItemController.items[indexPath.item]
		shoppingItemController.toggleHasBeenAdded(item: shoppingItem)
		collectionView.reloadItems(at: [indexPath])
    }
}
