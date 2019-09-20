//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Robert B on 9/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewController: UICollectionViewController {
    
    var shoppingListController = ShoppingList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "PlaceOrderShowSegue" {
            guard let placeOrderVC = segue.destination as? PlaceOrderViewController else { return }
            
            for item in shoppingListController.shoppingList {
                if item.isListed == true {
                    placeOrderVC.basket.append(item)
                }
            }
        }
    }
    
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return shoppingListController.inBasket.count
        } else if section == 1 {
            return shoppingListController.notInBasket.count
        } else {
            return 0
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingCell", for: indexPath) as? ShoppingItemCollectionViewCell else { return UICollectionViewCell() }
        
        if indexPath.section == 0 {
            cell.shoppingItem = shoppingListController.inBasket[indexPath.item]
        } else {
            cell.shoppingItem = shoppingListController.notInBasket[indexPath.item]
        }
        return cell
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let sectionTitle = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ShoppingItemsSection", for: indexPath) as? ShoppingItemsCollectionReusableView else { return UICollectionReusableView() }
        
        if indexPath.section == 0 {
            sectionTitle.sectionTitleLabel.text = "Basket: \(shoppingListController.inBasket.count) items."
        } else if indexPath.section == 1{
            sectionTitle.sectionTitleLabel.text = "Available Items"
        }
        
        return sectionTitle
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        let selectedItem: ShoppingItem = {
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

