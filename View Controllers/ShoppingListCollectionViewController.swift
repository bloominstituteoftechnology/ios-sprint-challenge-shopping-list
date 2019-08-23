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


	// : - PROPERTIES

	let shoppingItemController = ShoppingItemController()
	var orderDetailViewController: OrderDetailViewController?
	let itemCell = ShoppingItemCollectionViewCell()
	var numberOfItemsSelected = 0


	func selectedItemsCount() {
		for item in shoppingItemController.items {
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


	// MARK: - UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return shoppingItemController.items.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ShoppingItemCollectionViewCell
    
        // Configure the cell
    		let shoppingItem = shoppingItemController.items[indexPath.item]
			cell.shoppingItem = shoppingItem
			cell.imageView.image = shoppingItem.image
			cell.itemNameLabel.text = shoppingItem.itemName
		
        return cell
    }

    // MARK: UICollectionViewDelegate


    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let shoppingItem = shoppingItemController.items[indexPath.row]
	
    }


    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
