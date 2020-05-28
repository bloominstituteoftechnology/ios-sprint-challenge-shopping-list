//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Richard Gibbs on 5/25/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit


class ShoppingListCollectionViewController: UICollectionViewController {
    
    var shoppingItemController = ShoppingItemController()
    var shoppingListDetailViewController = ShoppingListDetailViewController()
    var shoppingItemCollectionViewCell = ShoppingItemCollectionViewCell()
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         self.clearsSelectionOnViewWillAppear = false
    }
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShoppingListDetailSegue" {
            let shoppingListDetailVC = segue.destination as? ShoppingListDetailViewController
            shoppingListDetailVC?.shoppingItemController = shoppingItemController
            return
        }
    }
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return shoppingItemController.shoppingItems.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingItemCell", for: indexPath) as? ShoppingItemCollectionViewCell else {
            fatalError("Collection view cell identifier is wrong or the cell is not a ShoppingItemCollectionViewCell")
        }
        
        // Configure the cell
        let shoppingListItem = shoppingItemController.shoppingItems[indexPath.item]
        cell.imageView.image = shoppingListItem.image
        cell.shoppingItemLabel.text = shoppingListItem.imageName
        if shoppingListItem.added == true {
            cell.hasBeenAddedLabel.text = "Added"
        } else {
            cell.hasBeenAddedLabel.text = "Not Added"
        }
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! ShoppingItemCollectionViewCell
        var chosenItem = shoppingItemController.shoppingItems[indexPath.item]
        chosenItem.added.toggle() // violating MVC
        shoppingItemController.shoppingItems[indexPath.item] = chosenItem
        cell.hasBeenAddedLabel.text = chosenItem.added ? "Added" : "Not Added" // Violating Custom Cell Responsibility
        print(chosenItem.added)
        
            
        
    }
    
    
    
}
 
