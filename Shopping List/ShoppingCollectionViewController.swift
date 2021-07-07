//
//  ShoppingCollectionViewController.swift
//  Shopping List
//
//  Created by Michael Redig on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit


class ShoppingCollectionViewController: UIViewController {
	@IBOutlet var activityLabel: UILabel!
	
	let shoppingItemController = ShoppingItemController()
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		activityLabel.alpha = 0
	}
	
	func updateActivityLabel(withItem item: ShoppingItem) {
		// new status is opposite the status of the item passed in
		let text = !item.inCart ? "Added \(item.imageName) to cart" : "Removed \(item.imageName) from cart"
		
		activityLabel.text = text
		activityLabel.alpha = 1.0
		UIView.animate(withDuration: 5.0) {
			self.activityLabel.alpha = 0
		}
	}
	
	//MARK:- Nav
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let dest = segue.destination as? OrderSubmissionViewController {
			dest.shoppingItemController = shoppingItemController
		}
	}
}


//MARK:- collection view data and delegate stuff
extension ShoppingCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return shoppingItemController.shoppingItems.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingCell", for: indexPath)
		let shoppingCell = cell as? ShoppingItemCollectionCell
		shoppingCell?.shoppingItem = shoppingItemController.shoppingItems[indexPath.item]
		
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let item = shoppingItemController.shoppingItems[indexPath.item]
		shoppingItemController.updateShoppingItem(item, inCart: !item.inCart)
		collectionView.reloadItems(at: [indexPath])
		updateActivityLabel(withItem: item)
	}
}
