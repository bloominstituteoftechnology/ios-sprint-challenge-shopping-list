//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Ryan Murphy on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ShoppingListCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(true)
        
        collectionView?.reloadData()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var itemSelected = shoppingItemController.shoppingItems[indexPath.item]
        

        
        switch itemSelected.hasBeenAdded == false {
        case true:
            itemSelected.hasBeenAdded = true
        case false:
            itemSelected.hasBeenAdded = false

    }
        
            
        
        
        print(itemSelected.hasBeenAdded)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
//        return shoppingItemController.shoppingItems.count
        return shoppingItemController.shoppingItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath)
        as! ShoppingListCollectionViewCell
    
        let item = shoppingItemController.shoppingItems[indexPath.item]
        cell.itemLable.text = item.name
        cell.itemImage.image = item.image
        
        
        if item.hasBeenAdded == true {
            cell.itemSelectedLabel.text = "Selected"
        } else {
            cell.itemSelectedLabel.text = "Not Selected"
        }

        
        
        return cell
        
    }
    
   

  let shoppingItemController = ShoppingItemController()

}
