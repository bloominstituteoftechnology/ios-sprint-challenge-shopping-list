//
//  ShoppingItemCollectionViewController.swift
//  Shopping List
//
//  Created by Elizabeth Thomas on 2/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewController: UICollectionViewController {
    
    let itemController = ShoppingItemController()

    // MARK: - Life Cycle Methods
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemController.items.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as? ShoppingItemCollectionViewCell else { return UICollectionViewCell()}
        
        let item = itemController.items[indexPath.item]
        cell.item = item
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShoppingItemDetailSegue" {
            let itemDetailVC = segue.destination as? ShoppingItemDetailViewController
            itemDetailVC?.itemController = itemController
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var item = itemController.items[indexPath.item]
        item.hasBeenAdded.toggle()
    }
    
}
