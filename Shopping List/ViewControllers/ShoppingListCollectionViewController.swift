//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Carolyn Lea on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewController: UICollectionViewController
{
    let shoppingItemController = ShoppingItemController()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return shoppingItemController.starterShoppingList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemListCell", for: indexPath) as! ItemListCollectionViewCell
    
        let shoppingItem = shoppingItemController.starterShoppingList[indexPath.item]
        cell.itemImageView.image = shoppingItem.imageIcon
        cell.itemNameLabel.text = shoppingItem.itemName
        cell.itemAddedLabel.text = "Add Item"
        cell.checkboxImageView.image = shoppingItem.checkboxImage
    
        return cell
    }

     // MARK: - Navigation
     //ShowAddressForm
     override func prepare(for segue: UIStoryboardSegue, sender: Any?)
     {
     
     }
    

}
