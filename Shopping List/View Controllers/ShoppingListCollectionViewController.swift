//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Sameera Roussi on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

private let groceryCell = "GroceryCell"

class ShoppingListCollectionViewController: UICollectionViewController {
    
    // MARK: - Properties

    let shoppingListController = ShoppingListController()
    var indexOfClickedItem: Int? = -1
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
    

    // MARK: - View state updates
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        collectionView?.reloadData()
    }
    
    // MARK: - View implementation
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingListController.shoppingItems.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: groceryCell, for: indexPath) as! ShoppingListCollectionViewCell
        
        let food = shoppingListController.shoppingItems[indexPath.item]
        
        
        cell.orderedStatusLabel.text = food.itemOrdered ? "Added" : "Not Added"
        cell.itemView.image = food.itemImage
        cell.itemLabel.text = food.itemName
        
       // shoppingListController.saveOrdered(food.itemName)
        
        return cell
    }
    
    // Capture a cell click
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // First get the index of the cell that was clicked
        let clickedCell = collectionView.cellForItem(at: indexPath) as! ShoppingListCollectionViewCell
        
        // Get the items in the cell and update the orderedStatus
        var clickedItem = shoppingListController.shoppingItems[indexPath.item]
        
        
        indexOfClickedItem = shoppingListController.shoppingItems.index(of: clickedItem)
        
       

        clickedItem.itemOrdered = !clickedItem.itemOrdered
        
        // Update the ordered item label in the view
        clickedCell.orderedStatusLabel.text = clickedItem.itemOrdered ? "Added" : "Not Added"
        
        
        // Now update the status in the model
        shoppingListController.shoppingItems.insert(clickedItem, at: indexOfClickedItem ?? -1)
        

    }
    
}


/*
 
 var photo: Photo? {
 didSet {
 updateViews()
 }
 
 print("The index item to update is: \(itemToUpdate)")
 print("The item to update is: \(clickedItem)")

 */
 
 
