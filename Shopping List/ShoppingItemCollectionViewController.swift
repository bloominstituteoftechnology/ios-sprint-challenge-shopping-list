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
        
        let item = shoppingItemController.shoppingItems[indexPath.item]
        
        cell.titleLabel.text = item.title
        cell.fruitImageView.image = UIImage(named: item.image)
        
        return cell
    }



}
