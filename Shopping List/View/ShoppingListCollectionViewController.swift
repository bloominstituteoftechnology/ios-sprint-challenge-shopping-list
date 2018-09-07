//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Dillon McElhinney on 9/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewController: UICollectionViewController {

    // MARK: - Properties
    let shoppingItemController = ShoppingItemController()
    
    // MARK: - Lifecycle Methods
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
    }
    
    // MARK: - UI Collection View Data Source
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingItemController.shoppingItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: .shoppingItemCellIdentifier, for: indexPath) as! ShoppingItemCollectionViewCell
        let shoppingItem = shoppingItemController.shoppingItems[indexPath.item]
        
        cell.shoppingItem = shoppingItem
    
        return cell
    }
    
    // MARK: - UI Collection View Delegate

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let shoppingItem = shoppingItemController.shoppingItems[indexPath.item]
        shoppingItemController.toggleIsOnList(for: shoppingItem)
        collectionView.reloadItems(at: [indexPath])
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == String.placeOrderSegueIdentifier {
            guard let destinationVC = segue.destination as? PlaceOrderViewController else { return }
            destinationVC.shoppingItemController = shoppingItemController
        }
    }
}
