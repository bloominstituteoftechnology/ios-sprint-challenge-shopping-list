//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Enrique Gongora on 1/31/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewController: UICollectionViewController {

    let shoppingListController = ShoppingListController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
    }
    
    
    //MARK: - CollectionView Functions
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingListController.shoppingList.count
    }
    
    func itemFor(indexPath: IndexPath) ->  ShoppingItem {
        if indexPath.section == 0{
            return shoppingListController.removedFromList[indexPath.item]
        }else{
            return shoppingListController.addedToList[indexPath.item]
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingListCell", for: indexPath) as? ShoppingListCollectionViewCell else { return UICollectionViewCell() }
        let shoppingList = shoppingListController.shoppingList[indexPath.item]
        cell.shoppingList = shoppingList
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CreateOrderSegue"{
            guard let orderVC = segue.destination as? OrderViewController else { return }
            orderVC.shoppingListController = shoppingListController
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? ShoppingListCollectionViewCell else { return }
        shoppingListController.updateList(for: indexPath.item)
        cell.itemName.text = shoppingListController.shoppingList[indexPath.item].addedToList ? "Added" : "Not Added"
    }
}
