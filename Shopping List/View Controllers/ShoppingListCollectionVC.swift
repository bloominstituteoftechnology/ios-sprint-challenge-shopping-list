//
//  ShoppingListCollectionVC.swift
//  Shopping List
//
//  Created by Norlan Tibanear on 6/12/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

//  private let reuseIdentifier = "Cell"

class ShoppingListCollectionVC: UICollectionViewController {
    
    // Variables
    var shoppingListController = ShoppingListController()

    override func viewDidLoad() {
        super.viewDidLoad()
 //       collectionView?.backgroundColor = UIColor.darkGray
        collectionView?.reloadData()
    }

    

    // MARK: UICollectionViewDataSource

//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingListController.shoppingItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as? ShoppingListCollectionViewCell else { return UICollectionViewCell() }
    
        let shoppingItem = shoppingListController.shoppingItems[indexPath.item]
        cell.shoppingItem = shoppingItem
        
//        cell.backgroundColor = .red
    
        return cell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let itemSelected = shoppingListController.shoppingItems[indexPath.item]
        shoppingListController.toggleLabel(product: itemSelected)
        collectionView.reloadData()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToOrderVC" {
            let orderVC = segue.destination as? OrderItemVC
            orderVC?.shoppingListController = shoppingListController
        }
    }
    

}
