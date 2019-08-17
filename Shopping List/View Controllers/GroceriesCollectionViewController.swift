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
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

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
        cell.buttonDelegate = self
    
        return cell
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
