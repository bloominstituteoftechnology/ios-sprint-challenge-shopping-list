//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Marlon Raskin on 6/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ShoppingItemCell"

class ShoppingListCollectionViewController: UICollectionViewController {
	
	var orderDetailViewController: OrderDetailViewController?
	let itemCell = ShoppingItemCollectionViewCell()
	let shoppingController = ShoppingController()
	var numberOfItemsSelected = 0
	

	func selectedItemsCount() {
		numberOfItemsSelected = 0
		for item in shoppingController.items {
			if item.hasBeenAdded == true {
				numberOfItemsSelected += 1
			}
			continue
		}
		print(numberOfItemsSelected)
	}

    override func viewDidLoad() {
        super.viewDidLoad()
		
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		guard let orderDetailVC = segue.destination as? OrderDetailViewController else { return }
		selectedItemsCount()
		orderDetailVC.numberOfItemsSelected = numberOfItemsSelected
    }


    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return shoppingController.items.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ShoppingItemCollectionViewCell
		
        // Configure the cell
		let shoppingItem = shoppingController.items[indexPath.item]
		cell.shoppingItem = shoppingItem
//		shoppingController.saveToPersistentStore()
		
		
        return cell
    }

    // MARK: UICollectionViewDelegate
	
	override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let shoppingItem = shoppingController.items[indexPath.item]
		shoppingController.toggleHasBeenAdded(item: shoppingItem)
		collectionView.reloadItems(at: [indexPath])
		
//		let shoppingItem = shoppingController.items[indexPath.item]
//		shoppingItem.hasBeenAdded = !shoppingItem.hasBeenAdded
		
	}
}
