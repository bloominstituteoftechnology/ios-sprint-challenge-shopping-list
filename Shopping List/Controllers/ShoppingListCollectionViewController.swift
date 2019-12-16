//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by alfredo on 12/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"
protocol ShoppingItemCollectionViewCellDelegate: AnyObject {
    func ItemTapped(forItem item: ShoppingItemCollectionViewCell)
}
class ShoppingListCollectionViewController: UICollectionViewController {

    // MARK: - Properties
    
    let shoppingItemController: ShoppingItemController = ShoppingItemController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shoppingItemController.fetchItems() // Load items to collection view
    }
    
    // MARK: - Methods
    private func itemFor(_ indexPath: IndexPath) -> ShoppingItem {
        switch indexPath.section {
        case 0:
            return shoppingItemController.addedShoppingItems[indexPath.item]
        default:
            return shoppingItemController.notAddedShoppingItems[indexPath.item]
        }
    }
    
    // MARK: - Navigation

     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let checkoutVC = segue.destination as? CheckoutViewController else { return }
        //set number of items
        checkoutVC.itemCount = shoppingItemController.shoppingItems.filter( {$0.added} ).count
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            print(shoppingItemController.notAddedShoppingItems.count)
            return shoppingItemController.addedShoppingItems.count
        default:
            return shoppingItemController.notAddedShoppingItems.count
        }
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as? ShoppingItemCollectionViewCell else { return UICollectionViewCell() }
        cell.delegate = self as ShoppingItemCollectionViewCellDelegate
        cell.shoppingItem = itemFor(indexPath)
        return cell
    }
}

// MARK: - Extensions

extension ShoppingListCollectionViewController: ShoppingItemCollectionViewCellDelegate {
    func ItemTapped(forItem item: ShoppingItemCollectionViewCell) {
        guard let shoppingItem = item.shoppingItem else { return }
        
        shoppingItemController.itemAddedToggled(for: shoppingItem)
        collectionView?.reloadData()
    }
}
