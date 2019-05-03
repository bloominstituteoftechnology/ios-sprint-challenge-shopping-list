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
		title = "Shopping List"
		
		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: nil)
		collectionView?.backgroundColor = .lightGray
		navigationController?.navigationBar.prefersLargeTitles = true
		
	
		
		
    }


	


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemNames.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingItem", for: indexPath)
		
		guard let itemCell = cell as? ShoppingItemCollectionViewCell else { return cell}
		itemCell.notAddedLabel.text = "Not Added"
		itemCell.imageView.image = UIImage(named: itemNames[indexPath.item])
		itemCell.itemNameLabel.text = itemNames[indexPath.row]
		itemCell.backgroundColor = .lightGray
		return itemCell
    }

	let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]

}
