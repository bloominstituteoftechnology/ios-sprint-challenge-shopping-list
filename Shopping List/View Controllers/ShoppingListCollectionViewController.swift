//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Alex Ladines on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewController: UICollectionViewController {

    // MARK: - Properties
    let shoppinglistController = ShoppingListController()
    
    // MARK: - ShoppingListCollectionViewController
    
    func updateView() {
        self.collectionView?.reloadData()
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.shoppinglistController.loadFromPersistantStorage()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.updateView()
    }
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.shoppinglistController.shoppingList.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Item", for: indexPath) as! ShoppingListCollectionViewCell
        
        let item = self.shoppinglistController.shoppingList[indexPath.item]
        
        cell.item = item
        
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    // When user taps an item
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.shoppinglistController.updateShoppingItem(item: self.shoppinglistController.shoppingList[indexPath.item])
        self.updateView()
    }
    
    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        self.shoppinglistController.updateShoppingItem(item: self.shoppinglistController.shoppingList[indexPath.item])
        self.updateView()
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SendOrder"
        {
            guard let shoppingListDetailVC = segue.destination as? ShoppingListDetailViewController else { return }

            shoppingListDetailVC.shoppinglistController = self.shoppinglistController
        }
    }



}
