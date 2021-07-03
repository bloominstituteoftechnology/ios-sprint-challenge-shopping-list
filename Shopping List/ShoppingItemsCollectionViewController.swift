//
//  ShoppingItemsCollectionViewController.swift
//  Shopping List
//
//  Created by Keri Levesque on 1/31/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

 
class ShoppingItemsCollectionViewController: UICollectionViewController {
 
    
    var shoppingItemController = ShoppingItemController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
    }

    
    // MARK: - Navigation

  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "OrderSegue" {
          guard let orderVC = segue.destination as? ShoppingItemsCollectionViewController else {return}
          orderVC.shoppingItemController = shoppingItemController

      }
    }


    // MARK: UICollectionViewDataSource
 

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingItemController.itemNames.count
        
    }


   override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingListViewCell", for: indexPath) as? ShoppingItemCollectionViewCell else {
           return UICollectionViewCell() }

       let item = shoppingItemController.itemNames[indexPath.item]
       cell.item = item
       return cell
   }

   // MARK: UICollectionViewDelegate
 
          override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
              return true
          }

          override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
              shoppingItemController.updateList(for: shoppingItemController.itemNames[indexPath.item])
              collectionView.reloadData()
          }
}
