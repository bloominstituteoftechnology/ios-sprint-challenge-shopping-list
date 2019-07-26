//
//  ShoppingItemCollectionViewController.swift
//  Shopping List
//
//  Created by Taylor Lyles on 7/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit



class ShoppingItemCollectionViewController: UICollectionViewController {
	
	let shoppingItemController = ShoppingItemController()

    override func viewDidLoad() {
        super.viewDidLoad()
		
		collectionView?.reloadData()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		collectionView?.reloadData()
	}


    // MARK: UICollectionViewDataSource
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "NextButtonShowSegue" {
			let destVC = segue.destination as! ShoppingItemViewController
			destVC.shoppingItemController = shoppingItemController
		}
	}

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return shoppingItemController.items.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as! ShoppingItemCollectionViewCell
	
    
        // Configure the cell
    	let newItem = shoppingItemController.items[indexPath.item]
		
		cell.shoppingItem = newItem
		cell.delegate = self
		
        return cell
	}
}

extension ShoppingItemCollectionViewController: ItemCollectionViewCellDelegate {
	
	func buttonImageWasPressed(on cell: UICollectionViewCell) {
		
		guard let index = collectionView?.indexPath(for: cell) else { return }
		
		let item = shoppingItemController.items[index.item]
		
		shoppingItemController.toggleHasBeenChanged(shoppingItem: item)
		
		collectionView?.reloadData(at: [index])
	}
}
