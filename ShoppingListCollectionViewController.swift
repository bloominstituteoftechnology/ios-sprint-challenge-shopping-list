//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Chris Dobek on 4/1/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewController: UICollectionViewController {
    
    var shoppingController = ShoppingListController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.canCancelContentTouches = false
        collectionView.isUserInteractionEnabled = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "ShowOrderSegue" {
        guard let destination = segue.destination as? OrderDetailViewController else { return }
            destination.shoppingController = shoppingController
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingController.shoppingItems.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingItemCell", for: indexPath) as? ShoppingListCollectionViewCell else { return UICollectionViewCell() }
        let item = shoppingController.shoppingItems[indexPath.item]
        cell.shoppingItem = item
        cell.isUserInteractionEnabled = true
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var item = shoppingController.shoppingItems[indexPath.item]
        item.isAdded.toggle()
        shoppingController.shoppingItems[indexPath.item] = item
        shoppingController.saveToPersistentStore()
        collectionView.reloadData()
    }
}
