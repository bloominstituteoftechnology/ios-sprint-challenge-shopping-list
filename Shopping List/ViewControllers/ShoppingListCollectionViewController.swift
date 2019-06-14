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
		cell.imageView.image = shoppingItem.image
		cell.itemNameLabel.text = shoppingItem.itemName
    
        return cell
    }

    // MARK: UICollectionViewDelegate
	
	override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let shoppingItem = shoppingController.items[indexPath.row]
		collectionView.reloadItems(at: [indexPath])
		
		
	}

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

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
