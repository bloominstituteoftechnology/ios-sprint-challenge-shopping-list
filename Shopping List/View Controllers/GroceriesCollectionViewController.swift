//
//  GroceriesCollectionViewController.swift
//  Shopping List
//
//  Created by Dillon P on 8/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit


class GroceriesCollectionViewController: UICollectionViewController {
    
    let groceryController = GroceryController()

    override func viewDidLoad() {
        super.viewDidLoad()
        groceryController.updateGroceries()
    }


    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return groceryController.groceries.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GroceryItemCell", for: indexPath) as?
            GroceryItemCollectionViewCell else { return UICollectionViewCell() }
        let groceryItem = groceryController.groceries[indexPath.item]
        cell.groceryItemName.text = groceryItem.name
        cell.groceryItemImage.image = UIImage(named: groceryItem.name)
        if groceryItem.inCart == true {
            cell.inCartStatusButton.setTitle("Added", for: .normal)
        } else if groceryItem.inCart == false {
            cell.inCartStatusButton.setTitle("Not Added", for: .normal)
        }
    
        return cell
    }

    
    private func groceryItemFor(indexPath: IndexPath) -> GroceryItem {
        return groceryController.groceries[indexPath.item]
    }
    
}





extension GroceriesCollectionViewController: GroceryItemCellDelegate {
    func toggleCartStatus(for cell: GroceryItemCollectionViewCell) {
            guard let indexPath = collectionView?.indexPath(for: cell) else { return }
            let item = groceryItemFor(indexPath: indexPath)
            groceryController.toggleCartStatus(for: item)
    }


}
