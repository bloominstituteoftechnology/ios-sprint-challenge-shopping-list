//
//  GrocerysCollectionViewController.swift
//  Shopping List
//
//  Created by brian vilchez on 8/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit


class GrocerysCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
        collectionView?.reloadData()
    }
var groceryController = GroceryController()
var groceryItem:GroceryItem?
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CheckoutShowSegue" {
            guard let checkoutVC = segue.destination as? OrderDetailViewController else {return}
            checkoutVC.groceryController = groceryController

        }
    }
 

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return groceryController.groceryItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as? GroceryItemCollectionViewCell else {return UICollectionViewCell()}
        cell.delegate = self
        let groceryItem = groceryController.groceryItems[indexPath.item]
        cell.groceryItem = groceryItem
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
             
    }
}

extension GrocerysCollectionViewController: GroceryItemCellDelegate {
    func togglehasBeenAdded(for cell: GroceryItemCollectionViewCell) {
        guard let groceryItem = groceryItem else {return}
        groceryController.updateHasBeenAdded(for: groceryItem)
        collectionView?.reloadData()
    }
    
    
}
