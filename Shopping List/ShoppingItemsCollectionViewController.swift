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
    }


	


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemNames.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingItem", for: indexPath)
		guard let itemCell = cell as? ShoppingItemCollectionViewCell else { return cell}
		itemCell.notAddedLabel.text = "this"
		itemCell.imageView.image = UIImage(named: itemNames[indexPath.item])
        return itemCell
    }

	let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]

}
// MARK: UICollectionViewDelegate

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
