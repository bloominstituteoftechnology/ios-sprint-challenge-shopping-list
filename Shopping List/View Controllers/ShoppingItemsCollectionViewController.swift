//
//  ShoppingItemsCollectionViewController.swift
//  Shopping List
//
//  Created by Alex Rhodes on 7/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemsCollectionViewController: UICollectionViewController {
    
    let shoppingItemsController = ShoppingItemController()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        collectionView?.reloadData()
    }

    // MARK: UICollectionViewDataSource
    

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return shoppingItemsController.showItems.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier = "ShowCustomerDetails" {
            if let destinationVC = segue.destination as? CustomerDetailViewController else {return}
        }
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as? ItemCollectionViewCell else {return UICollectionViewCell()}
    
        let item = shoppingItemsController.showItems[indexPath.row]
        cell.itemName.text = item.name
        
        if cell.itemName.text == String.apple {
            cell.itemImage.image = UIImage(named: String.apple)
        } else if cell.itemName.text == String.grapes {
            cell.itemImage.image = UIImage(named: String.grapes)
        } else if cell.itemName.text == String.milk {
             cell.itemImage.image = UIImage(named: String.milk)
        } else if cell.itemName.text == String.muffin {
            cell.itemImage.image = UIImage(named: String.muffin)
        } else if cell.itemName.text == String.popcorn {
            cell.itemImage.image = UIImage(named: String.popcorn)
        } else if cell.itemName.text == String.soda {
            cell.itemImage.image = UIImage(named: String.soda)
        } else if cell.itemName.text == String.strawberreis {
            cell.itemImage.image = UIImage(named: String.strawberreis)
        }
        
        return cell
    }
}
