//
//  ShoppingItemsCollectionViewController.swift
//  Shopping List
//
//  Created by Alex Rhodes on 7/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemsCollectionViewController: UICollectionViewController {
    
    let shoppingItemsController = ShoppingItemController()

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: UICollectionViewDataSource
    

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return shoppingItemsController.showItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as? ItemCollectionViewCell else {return UICollectionViewCell()}
    
        let item = shoppingItemsController.showItems[indexPath.row]
    
        return cell
    }
}
