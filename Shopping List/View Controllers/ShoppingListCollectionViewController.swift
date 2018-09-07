//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Jason Modisett on 9/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ShoppingItemCell"
private let newOrderSegueIdentifier = "NewOrder"

class ShoppingListCollectionViewController: UICollectionViewController {
    
    // MARK:- Lifecycle methods
    // Refresh collection view data when the view reappears
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        barButtonStateCheck()
    }
    
    
    // MARK: - Navigation methods
    // Inject data as a storyboard segue is being performed
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == newOrderSegueIdentifier {
            guard let destVC = segue.destination as? NewOrderFromItemsViewController else { return }
            destVC.shoppingItemController = shoppingItemController
        }
    }
    
    
    // MARK:- UICollectionViewDataSource methods
    // Number of sections
    override func numberOfSections(in collectionView: UICollectionView) -> Int { return 2 }
    
    
    // Items per section
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 { return shoppingItemController.addedItems.count
        } else if section == 1 { return shoppingItemController.notAddedItems.count
        } else { return 0 }}
    
    
    // Shopping item cell for the current index item
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ShoppingItemCollectionViewCell else { return UICollectionViewCell() }
    
        cell.item = indexPath.section == 0 ? shoppingItemController.addedItems[indexPath.item] : shoppingItemController.notAddedItems[indexPath.item]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let item = indexPath.section == 0 ? shoppingItemController.addedItems[indexPath.item] : shoppingItemController.notAddedItems[indexPath.item]
        shoppingItemController.update(item: item, isInShoppingList: !item.isInShoppingList)
        barButtonStateCheck()
    }
    
    private func barButtonStateCheck() {
        collectionView?.reloadData()
        orderItemsBarButton.isEnabled = shoppingItemController.addedItems.isEmpty ? false : true
    }
    
    
    // MARK:- Properties
    let shoppingItemController = ShoppingItemController()
    
    // MARK:- IBOutlets
    @IBOutlet weak var orderItemsBarButton: UIBarButtonItem!
    
}
