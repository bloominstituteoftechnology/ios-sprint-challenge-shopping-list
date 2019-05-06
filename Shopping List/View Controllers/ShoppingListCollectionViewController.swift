//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Sameera Roussi on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewController: UICollectionViewController {
    
    // MARK: - Properties
    
    let shoppingListController = ShoppingListController()
    private let groceryCell = "GroceryCell"
    var countOfPickedItems: Int = 0

    // MARK: - View states
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         shoppingListController.restoreItemOrdered()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        collectionView?.reloadData()
    }
    
    // MARK: - Collection view configuration
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingListController.shoppingItems.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: groceryCell, for: indexPath) as! ShoppingListCollectionViewCell
        
        let food = shoppingListController.shoppingItems[indexPath.item]
        
        // Poplulate the cell views
        
        cell.orderedStatusLabel.text = food.itemOrdered ? "Added" : "Not Added"
        cell.itemView.image = food.itemImage
        cell.itemLabel.text = food.itemName

        return cell
    }
    
    // MARK: - Respond to clicked cell
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // First get the index of the cell that was clicked
        let clickedCell = collectionView.cellForItem(at: indexPath) as! ShoppingListCollectionViewCell
        
        // Get the items in the cell and update the orderedStatus
        var clickedItem = shoppingListController.shoppingItems[indexPath.item]
        guard let indexOfClickedItem = shoppingListController.shoppingItems.index(of: clickedItem) else { return }
        clickedItem.itemOrdered = !clickedItem.itemOrdered
        // Now update the status in the model
        shoppingListController.shoppingItems[indexOfClickedItem].itemOrdered = clickedItem.itemOrdered
        
        // Update the ordered item label in the view
        clickedCell.orderedStatusLabel.text = clickedItem.itemOrdered ? "Added" : "Not Added"
    }
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Get the new view controller using segue.destination.
        guard let detailVC = segue.destination as? DetailViewController else { return }
        
        // Get the count of items selected
        countOfPickedItems = shoppingListController.shoppingItems.filter { $0.itemOrdered == true }.count
        
        
        // Save the itemOrdered data
        shoppingListController.saveItemOrdered()

        // Pass the selected object to the new view controller.
        detailVC.countOfPickedItems = countOfPickedItems
     }
    
}
 
 
