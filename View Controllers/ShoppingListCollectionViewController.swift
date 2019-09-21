//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by macbook on 9/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ItemCell"

class ShoppingListCollectionViewController: UICollectionViewController {
    
    let shoppingItemsController = ShoppingItemsController()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false


    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "CompleteOrderSegue" {
            if let shoppingListDVC = segue.destination as? ShoppingListDetailViewController {
                shoppingListDVC.shoppingItemsController = shoppingItemsController
            }
        }
       
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let shoppingItem = shoppingItemsController.shoppingList[indexPath.row]
        shoppingItemsController.AddShoppingItems(shoppingItem: shoppingItem)
        collectionView.reloadItems(at: [indexPath])
    }
    
    
    
    
 


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingItemsController.shoppingList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ShoppingListCollectionViewCell else { return UICollectionViewCell() }
        
        
        let shoppingItem = shoppingItemsController.shoppingList[indexPath.row]
        cell.shoppingItem = shoppingItem
    
        return cell
    }

   
}
