//
//  ShoppingItemsCollectionViewController.swift
//  Shopping List
//
//  Created by John McCants on 6/12/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemsCollectionViewController: UICollectionViewController {
    
    let shoppingItems = ShoppingModelController()

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Detail" {
            guard let destinationVC = segue.destination as? ShoppingItemsDetailViewController else {return}
            destinationVC.shoppingItems = shoppingItems
            
        }
    }
    

    // MARK: UICollectionViewDataSource


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return shoppingItems.items.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? ShoppingItemCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        
        cell.shoppingItem = shoppingItems.items[indexPath.item]
        
        return cell
    }

    // MARK: UICollectionViewDelegate
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if shoppingItems.items[indexPath.item].added == false {
            shoppingItems.items[indexPath.item].added = true
            collectionView.reloadData()
        } else if shoppingItems.items[indexPath.item].added == true {
        shoppingItems.items[indexPath.item].added = false
            collectionView.reloadData()
        }
       
    }

}
