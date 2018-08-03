//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Jonathan T. Miles on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewController: UICollectionViewController {

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowAddressForm" {
            guard let destVC = segue.destination as? DeliveryViewController else { return }
            destVC.shoppingController = shoppingController
        }
    }
    
    // MARK: - Custom functions
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        shoppingController.updateAddedToList(shoppingItem: shoppingController.shoppingItems[indexPath.item])
        self.collectionView?.reloadData()
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingController.shoppingItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingItemCell", for: indexPath) as! ShoppingCollectionViewCell
        let image = UIImage(data: shoppingController.shoppingItems[indexPath.item].imageData)
        cell.shoppingImageView.image = image
        cell.nameOfItemLabel.text = shoppingController.shoppingItems[indexPath.item].name
        if shoppingController.shoppingItems[indexPath.item].addedToList == false {
            cell.addedOrNotLabel.text = ""
        } else {
            cell.addedOrNotLabel.text = "added"
        }
        
        return cell
    }
    
    // Passed in classes
    var shoppingController = ShoppingController()
    
}
