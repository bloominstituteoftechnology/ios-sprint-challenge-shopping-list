//
//  ListCollectionViewController.swift
//  Shopping List
//
//  Created by conner on 2/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ListCollectionViewController: UICollectionViewController {

    let shoppingListController = ShoppingListController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
    }
    
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingListController.items.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListCell", for: indexPath) as? ListCollectionViewCell else { return UICollectionViewCell() }
        let shoppingList = shoppingListController.items[indexPath.item]
        cell.shoppingList = shoppingList
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "NewOrderSegue"{
            guard let orderVC = segue.destination as? OrderViewController else { return }
            orderVC.shoppingListController = shoppingListController
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        shoppingListController.updateList(for: shoppingListController.items[indexPath.item])
        collectionView.reloadData()
    }
}
