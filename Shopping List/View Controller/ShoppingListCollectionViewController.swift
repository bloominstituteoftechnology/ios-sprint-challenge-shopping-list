//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Nihal Erdal on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

//protocol UICollectionViewDelegate{
//
//    func didSelectItemAt(for cell: ShoppingListCollectionViewCell)
//}

private let reuseIdentifier = "Cell"

class ShoppingListCollectionViewController: UICollectionViewController, ShoppingListCollectionViewCellDelegete {
    
    
    
    var shoppingListController = ShoppingListController()
    
  

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }
    
    func cellTapped(for cell: ShoppingListCollectionViewCell) {
      
//        guard let shoppingItem = cell.shoppingItem else {return}
        
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddOrderSegue" {
            guard  let detailVC = segue.destination as? OrderDetailViewController else {
                return}
            
            detailVC.shoppingListController = shoppingListController
        }
    }


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        
        switch section {
        case 0:
            return shoppingListController.addedItems.count
           
        default:
             return shoppingListController.notAddedItems.count
        }
      
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingItemCell", for: indexPath) as? ShoppingListCollectionViewCell else
        {fatalError("Cell is not a ShoppingListCollectionViewCell")}
    

        cell.delegate = self
        let item = itemFor(indexPath: indexPath)
        cell.shoppingItem = item
        
        return cell
    }

    func itemFor(indexPath: IndexPath) -> ShoppingItem {
    
    if indexPath.section == 0 {
        return shoppingListController.addedItems[indexPath.row]
    }else{
        return shoppingListController.notAddedItems[indexPath.row]
    }
        
    // MARK: UICollectionViewDelegate

    
//    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //shoppingListController.shoppingItems[indexPath.row]
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
