//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Marissa Gonzales on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

protocol ItemAddedDelegate {
    
    func itemAdded(_ item: ShoppingItem)
}

class ShoppingListCollectionViewController: UICollectionViewController {
    
    var shoppingItemController = ShoppingModelController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        collectionView?.delegate = self
//        collectionView?.dataSource = self
        collectionView?.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    

    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingItemController.shoppingItems.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingItemCell", for: indexPath) as? ShoppingItemCollectionViewCell else { fatalError("Not a shopping item cell")}
        
        
   
        let myItem = shoppingItemController.shoppingItems[indexPath.row]
        
        cell.shoppingItem = myItem
        
        return cell
        
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        var shoppingItem = shoppingItemController.shoppingItems[indexPath.item]
        
        shoppingItemController.toggleHasBeenAdded(for: shoppingItem)
        
        shoppingItem.isAdded.toggle()
        
        shoppingItemController.saveToPersistentStore()
        
        collectionView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "sendOrderSegue" {
            guard let detailVC = segue.destination as? ShoppingItemsDetailViewController else { return }
            detailVC.shoppingItemCount = shoppingItemController.totalItemsAdded
        }
    }
}
