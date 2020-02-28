//
//  ShoppingItemsCollectionViewController.swift
//  Shopping List
//
//  Created by Wyatt Harrell on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ShoppingItemCell"

class ShoppingItemsCollectionViewController: UICollectionViewController {

    let shoppingItemController = ShoppingItemController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Navigation


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }


    // MARK: UICollectionViewDataSource


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return shoppingItemController.items.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ShoppingItemCollectionViewCell else { return UICollectionViewCell() }
    
        cell.shoppingItem = shoppingItemController.items[indexPath.item]
    
        return cell
    }


}
