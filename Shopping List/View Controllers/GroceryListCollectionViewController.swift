//
//  GroceryListCollectionViewController.swift
//  Shopping List
//
//  Created by Jake Connerly on 6/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "GroceryCell"

class GroceryListCollectionViewController: UICollectionViewController {

    let groceryItemController = GroceryItemController()
    
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

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return groceryItemController.groceryList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! GroceryCollectionViewCell
    
        let shoppingItem = groceryItemController.groceryList[indexPath.item]
        //cell.itemImageView.image = shoppingItem.itemImage
        //cell.itemNameLabel.text = shoppingItem.itemName
        cell.groceryItem = shoppingItem
        cell.delegate = self
        return cell
    }

}

extension GroceryListCollectionViewController: GroceryCollectionViewCellDelegate {
    func addedButtonWasTapped(on cell: GroceryCollectionViewCell) {
        guard let item = cell.groceryItem,
              let indexPath = collectionView?.indexPath(for: cell) else { return }
        groceryItemController.toggleAdded(item: item)
        collectionView?.reloadItems(at: [indexPath])

    }
    
    
}
