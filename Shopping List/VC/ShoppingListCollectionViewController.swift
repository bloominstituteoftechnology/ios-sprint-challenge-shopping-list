//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Lydia Zhang on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit


class ShoppingListCollectionViewController: UICollectionViewController {
    
    let shoppingItemController = ShoppingItemController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PlaceOrderSegue" {
            guard let placeOrderVC = segue.destination as? PlaceOrderViewController else {
                return
            }
            placeOrderVC.shoppingItemController = shoppingItemController
        }
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        if let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Header", for: indexPath) as? Header {
            if indexPath.section == 0 {
                header.headerLabel.text = "In Your Cart"
            } else {
                header.headerLabel.text = "On Shelf"
            }
            return header
        }
        return UICollectionReusableView()
    }
  
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        if section == 0 {
            return shoppingItemController.inCart.count
        } else {
            return shoppingItemController.onShelf.count
        }
    }
    
    func indexIn(indexPath: IndexPath) -> ShoppingItems {
        if indexPath.section == 0 {
            return shoppingItemController.inCart[indexPath.row]
        } else {
            return shoppingItemController.onShelf[indexPath.row]
        }
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingItemCell", for: indexPath) as? ShopingItemCollectionViewCell else {
            return UICollectionViewCell()}
        let item = indexIn(indexPath: indexPath)
        cell.shoppingItems = item
        return cell
        // Configure the cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selected = indexIn(indexPath: indexPath)
        shoppingItemController.toggle(item: selected)
        collectionView.reloadData()
    }

}
