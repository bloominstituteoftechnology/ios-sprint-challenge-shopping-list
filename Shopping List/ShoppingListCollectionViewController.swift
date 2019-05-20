//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Stephanie Bowles on 5/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ShoppingCell"

class ShoppingListCollectionViewController: UICollectionViewController {

    let shoppingItemController = ShoppingItemController()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.collectionView.reloadData()
    }
   

    // MARK: UICollectionViewDataSource



    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return self.shoppingItemController.shoppingItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ShoppingListCollectionViewCell
        
        let item = self.shoppingItemController.shoppingItems[indexPath.row]
//        cell.toggleLabel.text
        cell.imageView.image = item.image
        cell.toggleLabel.text = item.hasBeenAdded ? "Added" : "Not Added"
        // Configure the cell
        
        cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap(_:))))
       
        return cell
    }
    
    @objc func tap(_ sender: UITapGestureRecognizer) {
        
        let location = sender.location(in: self.collectionView)
        let indexPath = self.collectionView.indexPathForItem(at: location)
        
        if let index = indexPath {
            
            print("Got clicked on index: \(index)!")
            
        }
        
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let shoppingItem = shoppingItemController.shoppingItems[indexPath.item]
        shoppingItemController.toggleAdd(shoppingItems: shoppingItem)
            collectionView.reloadData()
        }
      
    }
    
    

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */
    
    

}
