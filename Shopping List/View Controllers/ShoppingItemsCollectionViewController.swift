//
//  ShoppingItemsCollectionViewController.swift
//  Shopping List
//
//  Created by Waseem Idelbi on 12/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemsCollectionViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemController.addItems()
    }
    
    
    // MARK: - Prepare for segue -
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "NextSegue" {
            let nextPageVC = segue.destination as! NextPageViewController
            nextPageVC.number = itemController.addedItems.count
        }
    }
    
    
    // MARK: -UICollectionViewDataSource-
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingItem", for: indexPath) as! ShoppingItemCollectionViewCell
        
        cell.item = itemController.items[indexPath.item]
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemController.items.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        itemController.items[indexPath.item].itemWasAdded.toggle()
        itemController.save(item: itemController.items[indexPath.item])
        collectionView.reloadData()
    }
    
    
    //MARK: -Important properties-
    
    var itemController = ShoppingItemController()
    
    
    
    //MARK: -Important methods-
    
    
} //End of class
