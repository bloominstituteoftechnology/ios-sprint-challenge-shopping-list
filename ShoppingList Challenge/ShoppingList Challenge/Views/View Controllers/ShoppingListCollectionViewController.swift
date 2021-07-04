//
//  ShoppingListCollectionViewController.swift
//  ShoppingList Challenge
//
//  Created by Michael Flowers on 1/18/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewController: UICollectionViewController, ItemCollectionViewCellDelegate {

    let shoppingItemController = ShoppingItemController()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSendOrderVC" {
            guard let toDestinationVC = segue.destination as? SendOrderViewController else { return }
            toDestinationVC.shoppingItemConroller = shoppingItemController
        }
    }
 
    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return shoppingItemController.items.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ItemCollectionViewCell else { return UICollectionViewCell() }
        
        //grab the data model object from the indexPath.item
        let item = shoppingItemController.items[indexPath.row]
        
        //pass the item into the itemCollectionViewCell's file
        cell.item = item
        
        //pass oer shoppingItemController
        cell.shoppingItemController = shoppingItemController

        //set the delegate to here
        cell.delegate = self
    
        return cell
    }
    
    
    //MARK: - ItemCollectionViewDelegate Function
    func addStatusChanged(for cell: UICollectionViewCell) {
        
        //get the index path of the cell so that I can use it to find it in the model's array
        guard let index = collectionView.indexPath(for: cell) else { return }
        
        //get the model
        let item = shoppingItemController.items[index.item]
        
        //toggle the model's property
        shoppingItemController.toggle(item: item)

        //reload collectionView
        collectionView.reloadData()
        
    }
}
