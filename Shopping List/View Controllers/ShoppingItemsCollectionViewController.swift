//
//  ShoppingItemsCollectionViewController.swift
//  Shopping List
//
//  Created by Rick Wolter on 10/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ItemCellReuseIdentifier"

class ShoppingItemsCollectionViewController: UICollectionViewController {


   

    let shoppingItemsController = ShoppingItemController()

   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
       
    }
    override func viewWillAppear(_ animated: Bool) {
              super.viewWillAppear(animated)
           self.collectionView?.reloadData()
         print(shoppingItemsController.shoppingItems.count)

          }



    // MARK: - Navigation

   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "cartSegueIdentifier" {
            guard let destinationVC = segue.destination as? CartViewController else { return }

            destinationVC.shoppingItemsController = shoppingItemsController
        }
    }


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingItemsController.shoppingItems.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ShoppingItemCollectionViewCell else {return UICollectionViewCell()}
        let itemToGoInCell = shoppingItemsController.shoppingItems[indexPath.item]
        
        cell.shoppingItem = itemToGoInCell

        print(shoppingItemsController.shoppingItems.count)
        // Configure the cell

        return cell
    }

    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

          let item = shoppingItemsController.shoppingItems[indexPath.item]

          shoppingItemsController.update(item: item)
          collectionView.reloadData()
      }

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {

    }
    */


}
