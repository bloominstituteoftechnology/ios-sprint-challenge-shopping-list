//
//  ShoppingItemCollectionViewController.swift
//  Shopping List
//
//  Created by Victor  on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class ShoppingItemCollectionViewControlller: UICollectionViewController {
    
    let shoppingItemController = ShoppingItemController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingItemController.shoppingItems.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let shoppingItem = shoppingItemController.shoppingItems[indexPath.item]
        
        shoppingItemController.update(shoppingItem: shoppingItem)
        collectionView.reloadData()
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ShoppingItemCollectionViewCell
        
        
        let shoppingItem = shoppingItemController.shoppingItems[indexPath.item]
        cell.shoppingItem = shoppingItem
        

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "order" {
            guard let destinationVC = segue.destination as? ViewController else {return}
            
            destinationVC.shoppingItemController = shoppingItemController
        }
    }

    
}
