//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Lambda_School_Loaner_241 on 2/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit




class ShoppingListCollectionViewController: UICollectionViewController {
    let shoppingListController = ShoppingListController()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return shoppingListController.shoppingList.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingListCell", for: indexPath) as? ShoppingListCollectionViewCell else { return UICollectionViewCell() }
        
        let shoppingList = shoppingListController.shoppingList[indexPath.item]
        
        cell.shoppinglist = shoppingList
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var shoppingListItem = shoppingListController.shoppingList[indexPath.row]
        
        shoppingListController.updateShoppingList(shoppingItem: shoppingListItem)
        collectionView.reloadItems(at: [indexPath])
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShoppingListSegue" {
           guard let shoppinglistVC = segue.destination as? ShoppingListViewController else { return }
            
            shoppinglistVC.shoppingListController = shoppingListController
            
            
        }
    }
        
        
        
        
        
        
        
        
        
}

