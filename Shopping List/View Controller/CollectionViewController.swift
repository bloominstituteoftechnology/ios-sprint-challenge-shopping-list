//
//  CollectionViewController.swift
//  Shopping List
//
//  Created by Nikita Thomas on 10/19/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit


class CollectionViewController: UICollectionViewController {
    
    let shoppingItemController = ShoppingItemController()
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        checkHasLaunched()
        collectionView.reloadData()
    }
    
    func checkHasLaunched() {
        let hasLaunched = UserDefaults.standard.bool(forKey: "hasLaunched")
        
        if !hasLaunched {
            loadItems()
            UserDefaults.standard.set(true, forKey: "hasLaunched")
        } else {
            shoppingItemController.loadData()
        }
    }
    
    let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
    
    func loadItems() {
        for i in itemNames {
            shoppingItemController.create(name: i)
        }
        shoppingItemController.saveData()
    }

    // MARK: UICollectionViewDataSource
    let reuseIdentifier = "itemCell"
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return shoppingItemController.items.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        
        let item = shoppingItemController.items[indexPath.item]
        if item.added {
            cell.addedLabel.text = "Added"
            cell.addedLabel.textColor = .red
            shoppingItemController.saveData()
        } else {
            cell.addedLabel.text = "Not Added"
            cell.addedLabel.textColor = .black
            shoppingItemController.saveData()
        }
        
        cell.nameLabel.text = item.name
        cell.image.image = UIImage(named: item.name)
    
    
        return cell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = shoppingItemController.items[indexPath.item]
        item.added.toggle()
        collectionView.reloadData()
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let item = shoppingItemController.items[indexPath.item]
        item.added.toggle()
        collectionView.reloadData()
    }




     // MARK: - Navigation
 
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? CheckoutViewController else {return}
        destination.shoppingItemController = shoppingItemController
     }

}
