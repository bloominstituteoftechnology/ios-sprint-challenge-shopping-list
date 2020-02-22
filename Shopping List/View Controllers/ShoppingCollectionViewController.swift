//
//  ShoppingCollectionViewController.swift
//  Shopping List
//
//  Created by Jarren Campos on 2/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//


import UIKit

class ShoppingCollectionViewController: UICollectionViewController {
    
    var shoppingListController = ShoppingListController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingListController.shoppingItem.count
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath) as? ShoppingItemCollectionViewCell else {
            return UICollectionViewCell() }
        
        let item = shoppingListController.shoppingItem[indexPath.item]
        cell.item = item
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        shoppingListController.updateList(for: shoppingListController.shoppingItem[indexPath.item])
        collectionView.reloadData()
    }
    
}
