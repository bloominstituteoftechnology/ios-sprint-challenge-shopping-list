//
//  ShoppingCollectionViewController.swift
//  Shopping List
//
//  Created by Conner on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ShoppingCollectionViewController: UICollectionViewController, ShoppingItemCollectionCellDelegate {
    
    func toggleAddedToList(for item: ShoppingCollectionViewCell) {
        guard let index = collectionView?.indexPath(for: item) else { return }
        let shoppingItem = shoppingController.shoppingItems[index.item]
        shoppingController.shoppingItemAddedToList(for: shoppingItem)
        collectionView?.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingController.shoppingItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingItemCell", for: indexPath) as! ShoppingCollectionViewCell
        
        cell.shoppingItemLabel.text = shoppingController.shoppingItems[indexPath.item].name
        cell.shoppingItemImageView.image = shoppingController.shoppingItems[indexPath.item].image
        cell.shoppingItem = shoppingController.shoppingItems[indexPath.item]
        cell.delegate = self
    
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "PlaceOrder") {
            if let vc = segue.destination as? CreateShoppingOrderViewController {
                vc.shoppingController = shoppingController
            }
        }
    }
    
    var shoppingController: ShoppingController = ShoppingController()
}
