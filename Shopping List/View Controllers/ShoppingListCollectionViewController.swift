//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Marlon Raskin on 7/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ItemCell"

class ShoppingListCollectionViewController: UICollectionViewController {

	let shoppingItemController = ShoppingItemController()

    override func viewDidLoad() {
        super.viewDidLoad()

    }


    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		guard let orderVC = segue.destination as? OrderDetailViewController else { return }
		orderVC.shoppingController = shoppingItemController
    }
	

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return shoppingItemController.shoppingItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ItemCollectionViewCell else { return UICollectionViewCell() }
    
        let item = shoppingItemController.shoppingItems[indexPath.item]

		cell.item = item
    
        return cell
    }

	override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let item = shoppingItemController.shoppingItems[indexPath.item]
		shoppingItemController.toggleItemsAdded(item: item)
		collectionView.reloadItems(at: [indexPath])
	}
}
