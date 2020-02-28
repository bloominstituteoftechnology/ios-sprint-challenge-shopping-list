//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Nichole Davidson on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit


class ShoppingListCollectionViewController: UICollectionViewController {

    let shoppingListController = ShoppingListController()
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }

    
    // MARK: - Navigation

   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SubmitOrderSegue" {
            guard let submitOrderVC = segue.destination as? SubmitOrderViewController else { return }
            submitOrderVC.shoppingListController = shoppingListController
        }
        
    }
    

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingListController.items.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingItemCell", for: indexPath) as? ShoppingItemCollectionViewCell else { fatalError("The cell is not a ShoppingItemCollectionViewCell")}
    
        let item = shoppingListController.items[indexPath.row]
        cell.shoppingItem = item
        return cell
    }


}
