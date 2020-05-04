//
//  ShoppingCollectionViewController.swift
//  Shopping List
//
//  Created by Ian French on 5/3/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit



class ShoppingCollectionViewController: UICollectionViewController {

    
    let shoppingController = ShoppingController()
    var shoppingList: ShopList?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

   
    // MARK: - Navigation

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.identifier == "listDetailSegue" {
            if let destinationVC = segue.destination as? OrderDetailViewController {
                destinationVC.shopController = shoppingController
            }
        }
    }
  

    // MARK: UICollectionViewDataSource

 


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return shoppingController.shopList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "foodItem", for: indexPath) as? ShoppingCollectionViewCell else { return UICollectionViewCell()}
    
        let shoppingList = shoppingController.shopList[indexPath.item]
        cell.shopList = shoppingList
        return cell
    }

    
    
    
    
    // MARK: UICollectionViewDelegate


    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)  {
        var item = shoppingController.shopList[indexPath.item]
        shoppingController.shopList[indexPath.item] = item
        item.itemAdd.toggle()
        shoppingController.shopList[indexPath.item] = item
        
        
        shoppingController.saveToPersistentStore()
        collectionView.reloadData()
    }
  

    

}
