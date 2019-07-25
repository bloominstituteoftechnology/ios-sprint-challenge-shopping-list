//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Alex Shillingford on 7/25/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ItemCell"

class ShoppingListCollectionViewController: UICollectionViewController {
    
    var shoppingItemController = ShoppingItemController()
    
    override func viewWillAppear(_ animated: Bool) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(true, forKey: .initShoppingListKey)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shoppingItemController.loadFromPersistentStore()
    }

    
    // MARK: - Navigation

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "NewOrderSegue" {
            guard let sendOrderVC = segue.destination as? SendOrderViewController else { return }
            let addedItems: [ShoppingItem] = shoppingItemController.shoppingList.filter({ $0.isAdded == true })
            
            sendOrderVC.addedItems = addedItems
        }
    }
    

    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return shoppingItemController.shoppingList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ShoppingItemCollectionViewCell else { return UICollectionViewCell() }
        var list = shoppingItemController.shoppingList
    
        // Configure the cell
        cell.shoppingItemLabel.text = list[indexPath.item].name
        cell.itemImageView.image = UIImage(named: list[indexPath.item].name)
        if list[indexPath.item].isAdded == true {
            cell.addedLabel.text = "Added"
        } else {
            cell.addedLabel.text = "Not Added"
        }
        
        return cell
    }

    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        shoppingItemController.shoppingList[indexPath.item].isAdded.toggle()
        shoppingItemController.saveToPersistentStore()
        collectionView.reloadData()
    }
    
    

}
