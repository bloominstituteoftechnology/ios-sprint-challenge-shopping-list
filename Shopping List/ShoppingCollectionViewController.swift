//
//  ShoppingCollectionViewController.swift
//  Shopping List
//
//  Created by Michael Redig on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit


class ShoppingCollectionViewController: UICollectionViewController {
	
	let shoppingItemController = ShoppingItemController()
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
	}
	
}


//MARK:- collection view data and delegate stuff
extension ShoppingCollectionViewController {
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return shoppingItemController.shoppingItems.count
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingCell", for: indexPath)
		let shoppingCell = cell as? ShoppingItemCollectionCell
		shoppingCell?.shoppingItem = shoppingItemController.shoppingItems[indexPath.item]
		
		
		return cell
	}
	
	override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let item = shoppingItemController.shoppingItems[indexPath.item]
		shoppingItemController.updateShoppingItem(item, inCart: !item.inCart)
		collectionView.reloadItems(at: [indexPath])
	}
}
