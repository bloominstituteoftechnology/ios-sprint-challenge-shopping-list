//
//  ShoppingListCollectionVC.swift
//  Shopping List
//
//  Created by Jeffrey Santana on 7/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionVC: UICollectionViewController {
	
	let shoppingListController = ShoppingListController()

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let orderVC = segue.destination as? OrderVC {
			orderVC.shoppingListController = shoppingListController
		}
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return shoppingListController.filteredList.count
    }

	override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
		guard let sectionHeaderView =  collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CategoryHeader", for: indexPath) as? CollectionHeaderView else { return UICollectionReusableView() }
		let categoryName = shoppingListController.filteredList[indexPath.section].cartStatus
		sectionHeaderView.categoryLbl.text = categoryName
		
		return sectionHeaderView
	}

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return shoppingListController.filteredList[section].list.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as? ItemCell else { return UICollectionViewCell() }
		let item = shoppingListController.filteredList[indexPath.section].list[indexPath.item]
		
		cell.item = item
    
        return cell
    }
	
	override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let selectedItem = shoppingListController.filteredList[indexPath.section].list[indexPath.item]
		shoppingListController.updateItemStatus(item: selectedItem)
		collectionView.reloadData()
	}

}
