//
//  ShoppingItemCollectionViewController.swift
//  Shopping List
//
//  Created by Christopher Aronson on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ItemCell"

class ShoppingItemCollectionViewController: UICollectionViewController {
    
    let shoppingItemController = ShoppingItemController()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        collectionView?.reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingItemController.shoppingItems.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Item", for: indexPath) as? ShoppingItemCollectionViewCell else { return UICollectionViewCell()}
        
        var item = shoppingItemController.shoppingItems[indexPath.item]
        
        cell.titleLabel.text = item.title
        cell.fruitImageView.image = UIImage(named: item.image)
        
        if item.added {
            cell.addedLabel.text = "Added"
            item.added = !item.added
        } else {
            cell.addedLabel.text = "Not Added"
            item.added = !item.added
        }
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Item", for: indexPath) as? ShoppingItemCollectionViewCell else { return }
        
//        print("\(shoppingItemController.shoppingItems[indexPath.item].added)")
//        shoppingItemController.shoppingItems[indexPath.item].added = !shoppingItemController.shoppingItems[indexPath.item].added
//        print("\(shoppingItemController.shoppingItems[indexPath.item].added)")
        
        if shoppingItemController.shoppingItems[indexPath.item].added {
            cell.addedLabel.text = "Not Added"
            shoppingItemController.shoppingItems[indexPath.item].added = !shoppingItemController.shoppingItems[indexPath.item].added
        } else {
            cell.addedLabel.text = "Added"
            shoppingItemController.shoppingItems[indexPath.item].added = !shoppingItemController.shoppingItems[indexPath.item].added
        }
        
        collectionView.reloadData()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ShowCart" {
            guard let destination = segue.destination as? CartViewController else { return }
            destination.numberOfItemsInCart = getNumberOfAddedItems()
        }
    }
    
    func getNumberOfAddedItems() -> Int {
        
        var count = 0
        
        for item in shoppingItemController.shoppingItems {
            if item.added == true {
                count += 1
            }
        }
        
        return count
    }

}
