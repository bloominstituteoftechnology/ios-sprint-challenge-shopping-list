//
//  ShoppingItemsCollectionViewController.swift
//  Shopping List
//
//  Created by Mike Nichols on 5/22/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemsCollectionViewController: UICollectionViewController {
    
    var myList = ShoppingList()
    
    var delegate: ShoppingListCellDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.dataSource = self
        collectionView?.delegate = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let destinationVC = segue.destination as? OrderViewController else { return }
        
        var itemsOnList: Int = 0
        for item in myList.shoppingList {
                  if item.isOnList == true {
                    itemsOnList += 1
                  }
              }
        destinationVC.itemCountLabel.text = String(itemsOnList)
    }
    


    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return myList.shoppingList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as? ShoppingItemsCollectionViewCell else {
        fatalError("Collection view cell identifier is wrong or cell is not of type ShoppingItemsCollectionViewCell" )
        }
        
        let item = myList.shoppingList[indexPath.item]
        cell.itemImageView.image = item.itemImage
        cell.itemNameLabel.text = item.itemName
    
    
        return cell
    
}
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) else { return }
        delegate?.cellWasTapped(cell)
    }
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */


    

}

extension ShoppingItemsCollectionViewController: ShoppingListCellDelegate {
    func updateViews() {
        
    }
    
    func cellWasTapped() {
        
    }
}

