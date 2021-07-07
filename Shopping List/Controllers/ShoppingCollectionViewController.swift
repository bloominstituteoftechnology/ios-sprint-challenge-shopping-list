//
//  ShoppingCollectionViewController.swift
//  Shopping List
//
//  Created by Tobi Kuyoro on 20/12/2019.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit



class ShoppingCollectionViewController: UICollectionViewController {
    
    var shoppingItemController = ShoppingItemController()

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShoppingListDetailShowSegue" {
            if let destinationVC = segue.destination as? ShoppingDetailViewController {
                
                destinationVC.shoppingList = shoppingItemController
            }
        }
    }


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return shoppingItemController.shoppingItem.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingItemCell", for: indexPath) as? ShoppingCollectionViewCell else { return UICollectionViewCell() }
    
        let item = shoppingItemController.shoppingItem[indexPath.row]
        cell.shoppingItem = item
    
        return cell
    }
}
