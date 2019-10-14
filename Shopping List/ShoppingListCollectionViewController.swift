//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Alex Thompson on 10/12/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ShoppingCell"

class ShoppingListCollectionViewController: UICollectionViewController {
    
    var shoppingListController = ShoppingListController()

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PlaceOrderSegue" {
            guard let placeOrderVC = segue.destination as? MakeOrderViewController else { return }
            
            for item in shoppingListController.shoppingList {
                if item.isAdded == true {
                    placeOrderVC.basket.append(item)
                }
            }
        }
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return shoppingListController.inBasket.count
        } else if section == 1 {
            return shoppingListController.notInBasket.count
        } else {
            return shoppingListController.shoppingList.count
            
        }
        
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingCell", for: indexPath) as? ShoppingItemsCollectionViewCell else { return UICollectionViewCell() }
        
        if indexPath.section == 0 {
            cell.shoppingItem = shoppingListController.inBasket[indexPath.item]
        } else {
            cell.shoppingItem = shoppingListController.notInBasket[indexPath.item]
        }
        
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        let selectedItem: ShoppingItems = {
            if indexPath.section == 0 {
                return shoppingListController.inBasket[indexPath.item]
            } else {
                return shoppingListController.notInBasket[indexPath.item]
            }
        }()
        
        shoppingListController.shoppingItemToggle(for: selectedItem)
        collectionView.reloadData()
        return false
        
    }
}
