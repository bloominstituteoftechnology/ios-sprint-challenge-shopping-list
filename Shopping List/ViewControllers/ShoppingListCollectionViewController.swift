//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Carolyn Lea on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewController: UICollectionViewController, ItemListCollectionCellDelegate
{
    let shoppingItemController = ShoppingItemController()
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(true)
        collectionView?.reloadData()
    }
    
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
        return shoppingItemController.shoppingItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemListCell", for: indexPath) as! ItemListCollectionViewCell
    
        let shoppingItem = shoppingItemController.shoppingItems[indexPath.item]
        cell.shoppingItem = shoppingItem
        cell.delegate = self
    
        return cell
    }
    
    func toggleItemAdded(for cell: ItemListCollectionViewCell)
    {
        guard let indexPath = collectionView?.indexPath(for: cell) else {return}
        let shoppingItem = shoppingItemController.shoppingItems[indexPath.row]
        shoppingItemController.updateItemAdded(for: shoppingItem)
        collectionView?.reloadItems(at: [indexPath])
    }
    
    override func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath)
    {
        let cell = collectionView.cellForItem(at: indexPath)
        toggleItemAdded(for: cell as! ItemListCollectionViewCell)
    }

     // MARK: - Navigation
     //ShowAddressForm
     override func prepare(for segue: UIStoryboardSegue, sender: Any?)
     {
     
     }
    

}
