//
//  ItemsCollectionViewController.swift
//  Shopping List
//
//  Created by Taylor Lyles on 5/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit



class ItemsCollectionViewController: UICollectionViewController {
	
	let shoppingListController = ShoppingListController()
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		collectionView?.reloadData()
	}
	
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		collectionView?.reloadData()
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		
		if segue.identifier == "nextSegue"{
			let destinationVC = segue.destination as! ItemViewController
			destinationVC.shoppingListController = shoppingListController
		}
	}
	
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		
		return shoppingListController.items.count
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ItemCollectionViewCell
		
		let NewItem = shoppingListController.items[indexPath.item]
		
		cell.shoppingItem = NewItem
		cell.delegate = self
		
		return cell
	}
	
}

extension ItemsCollectionViewController: ItemCollectionViewCellDelegate {
	
	func buttonImageWasPressed(on cell: UICollectionViewCell) {
		
		guard let index = collectionView?.indexPath(for: cell) else { return }
		
		let item = shoppingListController.items[index.item]
		
		shoppingListController.toggleHasBeenChanged(shoppingItem: item)
		
		collectionView?.reloadItems(at: [index])
		
	}
	
	
}
