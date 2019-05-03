//
//  ShoppingItemsCollectionViewController.swift
//  Shopping List
//
//  Created by Hector Steven on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ShoppingItemsCollectionViewController: UICollectionViewController {

	
    override func viewDidLoad() {
        super.viewDidLoad()
		navControllerSetup()
    }
	
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingItemController.shoppingItems.count
    }
	
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingItem", for: indexPath) 
		guard let itemCell = cell as? ShoppingItemCollectionViewCell else { return cell }
		let item = shoppingItemController.shoppingItems[indexPath.item]
		
		itemCell.item = item
		
		return itemCell
    }
	
	override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let item = shoppingItemController.shoppingItems[indexPath.item]
		shoppingItemController.updateAddedToCart(item: item)
		shoppingItemController.saveToPersistentStore()
		collectionView.reloadData()
	}

	
	let shoppingItemController = ShoppingItemController()
}

extension ShoppingItemsCollectionViewController {
	
	private func navControllerSetup(){
		title = "Shopping List"
		collectionView?.backgroundColor = .lightGray
		navigationController?.navigationBar.prefersLargeTitles = true
		collectionView?.reloadData()
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "nextSegue" {
			guard let viewController = segue.destination as? OrderDetailViewController else { return }
			viewController.itemsInCartCount = shoppingItemController.itemsInCartCount
		}
	}
	
}
