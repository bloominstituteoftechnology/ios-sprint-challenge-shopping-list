//
//  ItemsCollectionViewController.swift
//  Shopping List
//
//  Created by Taylor Lyles on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit



class ItemsCollectionViewController: UICollectionViewController {
	
	let shoppingListController = ShoppingListController()


    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView?.reloadData()

		
    }



    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		
        return shoppingListController.items.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as! ItemCollectionViewCell
		
		var item = shoppingListController.items[indexPath.item]
    
		cell.label.text = item.name
		cell.imageView.image = item.image
		
		if item.added {
			cell.addedLabel.text = "Added"
			item.added = !item.added
		} else {
			cell.addedLabel.text = "Not Added"
			item.added = !item.added
		}
    
        return cell
    }
	
	override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Item", for: indexPath) as? ItemCollectionViewCell else { return }
	


		
		func prepare(for segue: UIStoryboardSegue, sender: Any?) {
			
			if segue.identifier == "Cart" {
				guard let destination = segue.destination as? ItemViewController else { return }
				destination.numberOfItemsInCart = getNumberOfAddedItems()
			}
		}
	
		func getNumberOfAddedItems() -> Int {
			
			var count = 0
			
			for item in shoppingListController.items {
				if item.added == true {
					count += 1
				}
			}
			
			return count
		}

	
}
}
