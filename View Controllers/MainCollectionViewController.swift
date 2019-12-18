//
//  MainCollectionViewController.swift
//  Shopping List
//
//  Created by Osha Washington on 12/13/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

    private let reuseCell = "CollectionViewCell"
    private let addSegue = "NextButtonSegue"


class MainCollectionViewController: UICollectionViewController {

    let shoppingItemController = ShoppingItemController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shoppingItemController.createItems()
    
       // collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: .cell)

    }

    // MARK: UICollectionViewDataSource
    

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        print(shoppingItemController.shoppingItems.count)
        return shoppingItemController.shoppingItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseCell, for: indexPath) as? CollectionViewCell else { return UICollectionViewCell() }
     
        
        let item = shoppingItemController.shoppingItems[indexPath.item]
        cell.shoppingItem = item
//        cell.imageView.image = item.image
        cell.nameLabel.text = item.itemName
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case addSegue:
            if let addDetailVC = segue.destination as? SubmitOrderViewController {
                addDetailVC.shoppingItemController = self.shoppingItemController
            }
        default:
            return
        }
    }
     override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            
            let shoppingItem = shoppingItemController.shoppingItems[indexPath.item]
            shoppingItemController.updateAddedToCart(for: shoppingItem)

            collectionView.reloadData()
        }
}
