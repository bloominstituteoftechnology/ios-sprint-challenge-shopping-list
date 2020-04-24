//
//  ShoppingItemCollectionViewController.swift
//  Shopping List
//
//  Created by ronald huston jr on 4/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ShoppingItemCell"

class ShoppingItemCollectionViewController: UICollectionViewController {

    let shoppingItemController = ShoppingItemController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowOrder" {
            
            guard let ShowOrderVC = segue.destination as? CheckoutViewController else { return }
            
            //  handoff to Checkout
            
        } else if segue.identifier == "AddShoppingItem" {
            
            guard let AddShoppingItem = segue.destination as? AddShoppingItemViewController else { return }
            
            //  handoff to AddShoppingItem
        }
    }


    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return shoppingItemController.items.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ShoppingItemCollectionViewCell else { return UICollectionViewCell() }
    
        cell.item = shoppingItemController.items[indexPath.item]
    
        return cell
    }



    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ShoppingItemCollectionViewCell else { return }
        
        cell.item = shoppingItemController.items[indexPath.item]
        
        cell.delegate = self
        
        //  call cell.buttonTapped(self)
    }
}


extension ShoppingItemCollectionViewController: ShoppingItemCellDelegate {
    func 
}
