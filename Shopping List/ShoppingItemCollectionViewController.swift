//
//  ShoppingItemCollectionViewController.swift
//  Shopping List
//
//  Created by Jocelyn Stuart on 1/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit



class ShoppingItemCollectionViewController: UICollectionViewController, ItemCollectionViewCellDelegate {
    
    
    func toggleHasBeenAdded(for cell: ShoppingItemCollectionViewCell) {
        guard let indexPath = collectionView?.indexPath(for: cell) else { return }
        
        let shoppingItem = shoppingItemController.shoppingList[indexPath.item]
        //let shoppingItem = shoppingFor(indexPath: indexPath)
        
        shoppingItemController.updateIsAdded(for: shoppingItem)
       // listHelper.setThemePreferenceToAddedList()
        //collectionView?.reloadItems(at: [indexPath])
        collectionView?.reloadData()
    }
    
    
    let shoppingItemController = ShoppingItemController()
    let listHelper = ListHelper()

    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme()
        collectionView?.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTheme()
        collectionView?.reloadData()
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    // MARK: UICollectionViewDataSource

   /* override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }*/


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
          /*  if section == 0 {
                return shoppingItemController.addedItems.count
            } else {
                return shoppingItemController.unaddedItems.count
            } */
            return shoppingItemController.shoppingList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! ShoppingItemCollectionViewCell
    
            // Configure the cell
            let shoppingItem = shoppingItemController.shoppingList[indexPath.item]
            cell.shoppingItem = shoppingItem
            
            cell.itemImageView.image = shoppingItem.image
            cell.foodNameLabel.text = shoppingItem.name
            
            cell.delegate = self
    
            return cell
    }
    
   /* func shoppingFor(indexPath: IndexPath) -> ShoppingItem {
        if indexPath.section == 0 {
            return shoppingItemController.addedItems[indexPath.item]
        } else {
            return shoppingItemController.unaddedItems[indexPath.item]
        }
    } */
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "orderDetail" {
            guard let cellDetailController = segue.destination as? ItemDetailViewController, let cell = sender as? ShoppingItemCollectionViewCell  else { return }
            
            cellDetailController.shoppingItemController = shoppingItemController
            cellDetailController.listHelper = listHelper
            cellDetailController.shoppingItem = cell.shoppingItem
            
        }
        
    }
    
    func setTheme() {
        guard let theme = listHelper.themePreference else { return }
        
        if theme == "Added List" {
            shoppingItemController.saveToPersistentStore()
        } else {
            shoppingItemController.loadFoodFromAssets()
        }
        
    }
  

}

